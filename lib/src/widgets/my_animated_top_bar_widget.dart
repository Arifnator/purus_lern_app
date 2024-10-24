import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:purus_lern_app/src/config/palette.dart';
import 'package:purus_lern_app/src/features/chatbot/data/chatbot_current_message.dart';
import 'package:purus_lern_app/src/features/chatbot/presentation/chatbot_messages_text_widget.dart';
import 'package:purus_lern_app/src/features/chatbot/presentation/chatbot_screen.dart';

class MyAnimatedTopBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const MyAnimatedTopBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          border:
              Border(bottom: BorderSide(width: 0.5, color: borderStrokeGrey))),
      child: Column(
        children: [
          const Expanded(
            child: SizedBox(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: SizedBox()),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 80,
                      width: 240,
                      child: ChatbotMessagesTextWidget()),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ChatbotScreen(firstRequest: chatbotCurrentMessage),
                    ),
                  );
                },
                child: Lottie.asset(
                  "assets/animations/chatbot.json",
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
