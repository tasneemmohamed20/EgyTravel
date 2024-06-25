import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view_model/ChatbotCubit/cubit/chatbot_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  // final Gemini gemini = Gemini.instance;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatbotCubit(),
      child: Scaffold(
        backgroundColor: ColorsManager.primary.withOpacity(1),
        appBar: const CustomAppBar(
          title: "SNOUHI",
          enableBack: false,
        ),
        body: _buildUI(),
      ),
    );
  }

  Widget _buildUI() {
    return BlocBuilder<ChatbotCubit, ChatbotState>(
      builder: (context, state) {
        return DashChat(
          messageOptions: MessageOptions(
            currentUserContainerColor:
                ColorsManager.secondPrimary.withOpacity(1),
            currentUserTextColor: Colors.white70,
            containerColor: ColorsManager.secondPrimary.withOpacity(1),
            textColor: Colors.white70,
          ),
          inputOptions: InputOptions(
              inputToolbarPadding: const EdgeInsets.symmetric(horizontal: 16),
              trailing: [
                IconButton(
                  onPressed: () =>
                      context.read<ChatbotCubit>().sendMediaMessage(),
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
          currentUser: context.read<ChatbotCubit>().currentUser,
          onSend: (chatMessage) =>
              context.read<ChatbotCubit>().sendMessage(chatMessage),
          messages: state.messages,
        );
      },
    );
  }
}
