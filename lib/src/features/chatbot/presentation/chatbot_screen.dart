import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/features/chatbot/application/chatbot_service.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final ChatbotService _chatbotService = ChatbotService();
  final TextEditingController _userMessageController = TextEditingController();
  String _response = '';

  void _sendMessage(BuildContext context, String userMessage) async {
    String botResponse =
        await _chatbotService.getResponse(context, mounted, userMessage);
    setState(() {
      _response = botResponse;
    });
    _userMessageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Purutus')),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Text(_response),
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _userMessageController,
                    decoration: InputDecoration(
                        labelText: 'Schreibe eine Nachricht an Purutus...'),
                    onSubmitted: (_) {
                      _sendMessage(context, _userMessageController.text);
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(context, _userMessageController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
