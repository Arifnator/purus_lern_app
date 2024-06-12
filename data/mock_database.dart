import "database_repository.dart";
import '../models/category.dart';
import "../models/lexicon.dart";
import "../models/quiz.dart";
import "../models/user.dart";

class MockDatabaseCategories implements DatabaseRepositoryCategories {
  Map<int, Category> allCategories = {};

  @override
  void addCategory(int id, Category category) {
    int newId = 1;
    for (int id in allCategories.keys) {
      if (id >= newId) {
        newId = id + 1;
      }
      allCategories[newId] = category;
    }
  }

  /* Oder mit reduce
    void addCategory(int id, Category category) {
      int newId = allCategories.isEmpty
        ? 1
        : allCategories.keys.reduce((a, b) => a > b ? a : b) + 1;
      allCategories[newId] = category;
    } */

  @override
  void displayCategory(int id) {
    if (allCategories.containsKey(id)) {
      print("Kategorie: ${allCategories[id]!.name}");
    } else {
      print("Kein Eintrag gefunden");
    }
  }

  @override
  void removeCategory(int id) {
    if (allCategories.containsKey(id)) {
      allCategories.remove(id);
      print("Kategorie ${allCategories[id]!.name} ist erfolgreich gelöscht.");
    } else {
      print("Kein Eintrag gefunden");
    }
  }
}

class MockDatabaseLexica implements DatabaseRepositoryLexica {
  Map<int, Lexicon> allLexica = {};

  @override
  void addLexicon(Lexicon lexicon) {
    int newId = 1;
    for (int id in allLexica.keys) {
      if (id >= newId) {
        newId = id + 1;
      }
      allLexica[newId] = lexicon;
    }
  }

  /* Oder mit reduce
    void addLexicon(Lexicon lexicon) {
      int newId = allLexica.isEmpty
        ? 1
        : allLexica.keys.reduce((a, b) => a > b ? a : b) + 1;
      allLexica[newId] = lexicon;
    } */

  @override
  void displayLexicon(int id) {
    if (allLexica.containsKey(id)) {
      print("${allLexica[id]!.title}: ${allLexica[id]!.description}");
    } else {
      print("Kein Eintrag gefunden");
    }
  }

  @override
  void removeLexicon(int id) {
    if (allLexica.containsKey(id)) {
      allLexica.remove(id);
      print("Lexikonnummer $id ist erfolgreich gelöscht.");
    } else {
      print("Kein Eintrag gefunden");
    }
  }
}

class MockDatabaseQuizzes implements DatabaseRepositoryQuizzes {
  Map<int, Quiz> allQuizzes = {};

  @override
  void addQuiz(Quiz quiz) {
    int newId = 1;
    for (int id in allQuizzes.keys) {
      if (id >= newId) {
        newId = id + 1;
      }
    }
    allQuizzes[newId] = quiz;
  }
  /* Oder mit reduce
  void addQuiz(Quiz quiz) {
    int newId = allQuizzes.isEmpty
        ? 1
        : allQuizzes.keys.reduce((a, b) => a > b ? a : b) + 1;
    allQuizzes[newId] = quiz;
  } */

  @override
  void removeQuiz(int id) {
    if (allQuizzes.containsKey(id)) {
      allQuizzes.remove(id);
      print("Quiznummer $id ist erfolgreich gelöscht.");
    } else {
      print("Quiznummer $id ist nicht aufgelistet.");
    }
  }

  @override
  void displayQuizInfo(int id) {
    print('Quiz $id: ${allQuizzes[id]!.question}');
    for (int i = 0; i < allQuizzes[id]!.answers.length; i++) {
      print('${i + 1}. ${allQuizzes[id]!.answers[i]}');
    }
  }

  @override
  void displayRightAnswer(int id, int userAnswerIndex) {
    if (userAnswerIndex == allQuizzes[id]!.correctAnswerIndex) {
      print(
          '${allQuizzes[id]!.answers[userAnswerIndex]} ist die richtige Antwort!');
    } else {
      print(
          '${allQuizzes[id]!.answers[userAnswerIndex]} ist falsch. ${allQuizzes[id]!.answers[allQuizzes[id]!.correctAnswerIndex]} ist die richtige Antwort!');
    }
  }
}

class MockDatabaseUsers implements DatabaseRepositoryUsers {
  Map<String, User> allUsers = {};

  @override
  void addUser(String id, User user) {
    allUsers[id] = user;
  }

  @override
  void removeUser(String id) {
    if (allUsers.containsKey(id)) {
      allUsers.remove(id);
      print("Benutzer $id ist erfolgreich gelöscht.");
    } else {
      print("Benutzer $id wurde nicht gefunden.");
    }
  }

  @override
  void displayUserInfo(String id) {
    if (allUsers.containsKey(id)) {
      print(
          "Benutzername: $id,\nVorname: ${allUsers[id]!.firstName},\nNachname: ${allUsers[id]!.lastName},\nGeschlecht: ${allUsers[id]!.isWomen ? "Weiblich" : "Männlich"},\nEmail: ${allUsers[id]!.email},\nGeburtsdatum: ${allUsers[id]!.dateOfBirth},\nRegistrierdatum: ${allUsers[id]!.registrationDate}");
    } else {
      print("Benutzer $id wurde nicht gefunden.");
    }
  }
}
