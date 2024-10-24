import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/config/my_text_styles.dart';
import 'package:purus_lern_app/src/features/chatbot/application/chatbot_random_message.dart';
import 'dart:async';

import 'package:purus_lern_app/src/features/chatbot/data/chatbot_current_message.dart';

class ChatbotMessagesTextWidget extends StatefulWidget {
  const ChatbotMessagesTextWidget({super.key});

  @override
  State<ChatbotMessagesTextWidget> createState() =>
      _ChatbotMessagesTextWidgetState();
}

class _ChatbotMessagesTextWidgetState extends State<ChatbotMessagesTextWidget> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 30), (Timer timer) {
      setState(() {
        chatbotCurrentMessage = getRandomChatbotMessage();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      chatbotCurrentMessage,
      style: MyTextStyles.subTitle,
      overflow: TextOverflow.ellipsis,
    );
  }
}
