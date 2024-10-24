import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "dart:convert";

const String moodleUrl = "https://purus-online.de/";
const String loginEndpoint = "/login/token.php";

Future<void> loginReq(String username, String password) async {
  try {
    final url = Uri.parse("$moodleUrl$loginEndpoint");

    final response = await http.post(
      url,
      body: {
        "username": username,
        "password": password,
        "service": "moodle_mobile_app",
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final responseData = json.decode(response.body);

      if (responseData.containsKey("token")) {
        final token = responseData["token"];
        debugPrint("Login erfolgreich. Token: $token");

        getUserInfo(token);
        // Mit dem Token kannst du jetzt API-Anfragen an Moodle senden
      } else {
        debugPrint(
            "Login fehlgeschlagen: ${responseData["error"] ?? "Unbekannter Fehler"}");
      }
    } else {
      debugPrint("Fehler bei der Anfrage: ${response.statusCode}");
    }
  } catch (e) {
    debugPrint("Fehler: $e");
  }
}

Future<void> getUserInfo(String token) async {
  final url = Uri.parse(
      '$moodleUrl/webservice/rest/server.php?wsfunction=core_webservice_get_site_info&moodlewsrestformat=json');

  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
  );

  if (response.statusCode == 200) { 
    print('User Info: ${response.body}');
  } else {
    print('Fehler bei der Anfrage: ${response.statusCode}');
    print('Antwort: ${response.body}');
  }
}
