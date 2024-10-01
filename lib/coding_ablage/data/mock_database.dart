// import "database_repository.dart";
// import '../models/category.dart';
// import "../models/lexicon.dart";
// import "../models/quiz.dart";
// import "../models/user.dart";

// class MockDatabaseCategories implements DatabaseRepositoryCategories {
//   @override
//   Map<int, Category> allCategories = {
//     1: Category(name: "Kategorie 1"),
//     2: Category(name: "Kategorie 2"),
//     3: Category(name: "Kategorie 3"),
//     4: Category(name: "Kategorie 4"),
//     5: Category(name: "Kategorie 5"),
//     6: Category(name: "Kategorie 6"),
//     7: Category(name: "Kategorie 7"),
//     8: Category(name: "Kategorie 8"),
//     9: Category(name: "Kategorie 9"),
//     10: Category(name: "Kategorie 10"),
//   };

//   @override
//   void addCategory(Category category) {
//     int newId = allCategories.isEmpty
//         ? 1
//         : allCategories.keys.reduce((a, b) => a > b ? a : b) + 1;
//     allCategories[newId] = category;
//   }

//   @override
//   void displayCategory(int id) {
//     if (allCategories.containsKey(id)) {
//       print("Kategorie: ${allCategories[id]!.name}");
//     } else {
//       print("Kein Eintrag gefunden");
//     }
//   }

//   @override
//   void removeCategory(int id) {
//     if (allCategories.containsKey(id)) {
//       print("Kategorie ${allCategories[id]!.name} ist erfolgreich gelöscht.");
//       allCategories.remove(id);
//     } else {
//       print("Kein Eintrag gefunden");
//     }
//   }
// }

// class MockDatabaseLexica extends MockDatabaseCategories
//     implements DatabaseRepositoryLexica {
//   @override
//   Map<Category, Map<int, Lexicon>> allLexica = {};
//   int _nextId = 1;

//   MockDatabaseLexica() {
//     for (Category category in allCategories.values) {
//       allLexica[category] = {};
//     }
//   }

//   @override
//   void addLexicon(Category category, Lexicon lexicon) {
//     if (!allLexica.containsKey(category)) {
//       addCategory(category);
//       allLexica[category] = {};
//     }
//     allLexica[category]![_nextId] = lexicon;
//     _nextId++;
//   }

//   @override
//   void removeLexicon(int id) {
//     for (var category in allLexica.keys) {
//       if (allLexica[category]!.containsKey(id)) {
//         allLexica[category]!.remove(id);
//         print("Lexikonnummer $id ist erfolgreich gelöscht.");
//         return;
//       }
//     }
//     print("Kein Eintrag gefunden");
//   }

//   @override
//   void displayLexicon(int id) {
//     for (var category in allLexica.keys) {
//       if (allLexica[category]!.containsKey(id)) {
//         print(
//             "${allLexica[category]![id]!.title}: ${allLexica[category]![id]!.description}");
//         return;
//       }
//     }
//     print("Kein Eintrag gefunden");
//   }
// }

// class MockDatabaseQuizzes extends MockDatabaseCategories
//     implements DatabaseRepositoryQuizzes {
//   @override
//   Map<Category, Map<int, Quiz>> allQuizzes = {};
//   int _nextId = 1;

//   MockDatabaseQuizzes() {
//     for (Category category in allCategories.values) {
//       allQuizzes[category] = {};
//     }
//   }

//   @override
//   void addQuiz(Category category, Quiz quiz) {
//     if (!allQuizzes.containsKey(category)) {
//       addCategory(category);
//       allQuizzes[category] = {};
//     }
//     allQuizzes[category]![_nextId] = quiz;
//     _nextId++;
//   }

//   @override
//   void removeQuiz(int id) {
//     for (var category in allQuizzes.keys) {
//       if (allQuizzes[category]!.containsKey(id)) {
//         allQuizzes[category]!.remove(id);
//         print("Quiznummer $id ist erfolgreich gelöscht.");
//         return;
//       }
//     }
//     print("Kein Eintrag gefunden");
//   }

//   @override
//   void displayQuizInfo(int id) {
//     for (var category in allQuizzes.keys) {
//       if (allQuizzes[category]!.containsKey(id)) {
//         print('Quiz $id: ${allQuizzes[category]![id]!.question}');
//         for (int i = 0; i < allQuizzes[category]![id]!.answers.length; i++) {
//           print('${i + 1}. ${allQuizzes[category]![id]!.answers[i]}');
//         }
//       } else {
//         print("Kein Eintrag gefunden");
//       }
//     }
//   }

//   @override
//   void displayRightAnswer(int id, int userAnswerIndex) {
//     for (var category in allQuizzes.keys) {
//       if (userAnswerIndex == allQuizzes[category]![id]!.correctAnswerIndex) {
//         print(
//             '${allQuizzes[category]![id]!.answers[userAnswerIndex]} ist die richtige Antwort!');
//       } else {
//         print(
//             '${allQuizzes[category]![id]!.answers[userAnswerIndex]} ist falsch. ${allQuizzes[category]![id]!.answers[allQuizzes[category]![id]!.correctAnswerIndex]} ist die richtige Antwort!');
//       }
//     }
//   }
// }

// class MockDatabaseUsers implements DatabaseRepositoryUsers {
//   @override
//   Map<String, User> allUsers = {};

//   @override
//   void addUser(String id, User user) {
//     allUsers[id] = user;
//   }

//   @override
//   void removeUser(String id) {
//     if (allUsers.containsKey(id)) {
//       allUsers.remove(id);
//       print("Benutzer $id ist erfolgreich gelöscht.");
//     } else {
//       print("Benutzer $id wurde nicht gefunden.");
//     }
//   }

//   @override
//   void displayUserInfo(String id) {
//     if (allUsers.containsKey(id)) {
//       print(
//           "Benutzername: $id,\nVorname: ${allUsers[id]!.firstName},\nNachname: ${allUsers[id]!.lastName},\nGeschlecht: ${allUsers[id]!.isWomen ? "Weiblich" : "Männlich"},\nEmail: ${allUsers[id]!.email},\nGeburtsdatum: ${allUsers[id]!.dateOfBirth},\nRegistrierdatum: ${allUsers[id]!.registrationDate}");
//     } else {
//       print("Benutzer $id wurde nicht gefunden.");
//     }
//   }
// }