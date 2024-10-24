import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:purus_lern_app/src/config/my_text_styles.dart';
import 'package:purus_lern_app/src/config/palette.dart';
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
          SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hallo Arif!",
                      style: MyTextStyles.mainTitle,
                    ),
                    ChatbotMessagesTextWidget(),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ChatbotScreen()));
                  },
                  child: Lottie.asset(
                    "assets/animations/chatbot.json",
                    height: 80,
                    width: 80,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
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
