import 'dart:io';
import 'dart:typed_data';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(
    id: "0",
    firstName: "User",
  );
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "SNOUHI",
    profileImage: "assets/images/chatbot.jpg",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary.withOpacity(1),
      appBar: CustomAppBar(
        title: "SNOUHI",
        enableBack: false,
        leading: backButton(context),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
      messageOptions: MessageOptions(
        currentUserContainerColor: ColorsManager.secondPrimary.withOpacity(1),
        currentUserTextColor: Colors.white70,
        containerColor: ColorsManager.secondPrimary.withOpacity(1),
        textColor: Colors.white70,
      ),
      inputOptions: InputOptions(
          inputToolbarPadding: const EdgeInsets.symmetric(horizontal: 16),
          trailing: [
            IconButton(
              onPressed: _sendMediaMessage,
              icon: Icon(
                Icons.image_rounded,
                color: ColorsManager.secondPrimary.withOpacity(1),
              ),
            )
          ],
          sendOnEnter: true,
          sendButtonBuilder: (Function onSend) {
            return IconButton(
              onPressed: () {
                onSend();
              },
              icon: Icon(
                Icons.send_rounded,
                color: ColorsManager.secondPrimary.withOpacity(1),
              ),
            );
          }),
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }
      gemini
          .streamGenerateContent(
        question,
        images: images,
      )
          .listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          lastMessage.text += response;
          setState(
            () {
              messages = [lastMessage!, ...messages];
            },
          );
        } else {
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: response,
          );
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void _sendMediaMessage() async {
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
      _sendMessage(chatMessage);
    }
  }
}
