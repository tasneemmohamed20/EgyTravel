import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:egy_travel/res/string_manager.dart';
part 'chatbot_state.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  ChatUser currentUser = ChatUser(
    id: "0",
    firstName: "User",
  );
  ChatUser openAiUser = ChatUser(
    id: "1",
    firstName: "SNOUHI",
    profileImage: "assets/images/chatbot.png",
  );

  ChatbotCubit() : super(ChatbotState([])) {
    OpenAI.apiKey = AppStrings.openAiApiKey;
  }

  void sendMessage(ChatMessage chatMessage) {
    final messages = [chatMessage, ...state.messages];
    emit(ChatbotState(messages));
    _processMessage(chatMessage, messages);
  }

  void _processMessage(
      ChatMessage chatMessage, List<ChatMessage> messages) async {
    try {
      String question = chatMessage.text;

      // Create OpenAI messages
      List<OpenAIChatCompletionChoiceMessageModel> chatMessages = [
        OpenAIChatCompletionChoiceMessageModel(
          role: OpenAIChatMessageRole.user,
          content: [
            OpenAIChatCompletionChoiceMessageContentItemModel.text(question),
          ],
        ),
      ];

      // Handle image if present
      if (chatMessage.medias?.isNotEmpty ?? false) {
        final imageFile = File(chatMessage.medias!.first.url);
        final imageBytes = await imageFile.readAsBytes();
        final base64Image = base64Encode(imageBytes);

        chatMessages = [
          OpenAIChatCompletionChoiceMessageModel(
            role: OpenAIChatMessageRole.user,
            content: [
              OpenAIChatCompletionChoiceMessageContentItemModel.text(question),
              OpenAIChatCompletionChoiceMessageContentItemModel.imageUrl(
                "data:image/jpeg;base64,$base64Image",
              ),
            ],
          ),
        ];
      }

      // Create streaming request
      final stream = OpenAI.instance.chat.createStream(
        model: "gpt-4o-mini",
        messages: chatMessages,
        maxTokens: 1000,
      );

      ChatMessage? botMessage;
      String fullResponse = "";

      await for (final chunk in stream) {
        if (chunk.choices.isNotEmpty) {
          final delta = chunk.choices.first.delta;
          if (delta.content != null && delta.content!.isNotEmpty) {
            final content = delta.content!.first;
            if (content?.text != null) {
              fullResponse += content?.text ?? "";

              if (botMessage == null) {
                // Create new message
                botMessage = ChatMessage(
                  user: openAiUser,
                  createdAt: DateTime.now(),
                  text: fullResponse,
                );
                emit(ChatbotState([botMessage, ...messages]));
              } else {
                // Update existing message
                botMessage.text = fullResponse;
                final updatedMessages = [botMessage, ...messages];
                emit(ChatbotState(updatedMessages));
              }
            }
          }
        }
      }
    } catch (e) {
      print('Error: $e');
      // Show error message
      ChatMessage errorMessage = ChatMessage(
        user: openAiUser,
        createdAt: DateTime.now(),
        text: "Sorry, I encountered an error. Please try again.",
      );
      emit(ChatbotState([errorMessage, ...messages]));
    }
  }

  void sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: 'Describe the image',
        medias: [
          ChatMedia(
            url: file.path,
            fileName: "",
            type: MediaType.image,
          )
        ],
      );
      sendMessage(chatMessage);
    }
  }
}