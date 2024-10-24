import "dart:convert";
import "package:flutter/cupertino.dart";
import "package:http/http.dart" as http;
import "package:purus_lern_app/src/features/chatbot/application/chatbot_apikey.dart";
import "package:purus_lern_app/src/widgets/my_snack_bar.dart";

class ChatbotService {
  final String _apiUrl = "https://api.openai.com/v1/chat/completions";

  Future<String> getResponse(
      BuildContext context, bool isMounted, String userMessage) async {
    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $chatbotApikey",
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "system",
            "content":
                "Du Heisst Purutus. Du bist ein Pflegehelfer-Lern-Chatbot von Purus Medical Academy GmbH in Berlin. Beantworte Fragen nur im Zusammenhang mit Pflegehelfer-Lern-Themen, wie z.B. Patientenpflege, Notfallmaßnahmen und Pflegemanagement. Du kannst nur Deutsch."
          },
          {"role": "user", "content": userMessage}
        ],
        "max_tokens": 300,
      }),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));

      return data["choices"][0]["message"]["content"].toString();
    } else {
      if (isMounted) {
        // ignore: use_build_context_synchronously
        mySnackbar(context,
            "Status Code: ${response.statusCode}, Failed to load response: ${response.body}");
      }
      return "Fehler beim Laden der Antwort";
    }
  }
}
