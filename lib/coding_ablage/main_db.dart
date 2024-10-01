// import 'models/category.dart';
// import 'models/user.dart';
// import 'models/quiz.dart';
// import "data/database_repository.dart";
// import "data/mock_database.dart";




// // komplettprogramm just for fun + quiz mit stdin
// // import 'models/lexicon.dart';
// // fix: Kategorie 5 null + kategorie 5 wird neu erstellt + Unhandled exception1...
// // Alle funktionen weiter testen


// void main() {
//   DatabaseRepositoryUsers userDb = MockDatabaseUsers();

//   userDb.addUser(
//       "Arifnator",
//       User(
//           firstName: "Arif",
//           lastName: "Ayduran",
//           isWomen: false,
//           email: "aaa",
//           dateOfBirth: DateTime(1991, 06, 22),
//           registrationDate: DateTime.now(),
//           password: "bbb",
//           regCode: "www",
//           faceId: true));

//   userDb.displayUserInfo("Arifnator");
//   userDb.removeUser("Arifnator");
//   userDb.displayUserInfo("Arifnator");

//   print("----------------------------------------------------------------");

//   MockDatabaseQuizzes quizDb = MockDatabaseQuizzes();

//   quizDb.addQuiz(
//       Category(name: "Kategorie 5"),
//       Quiz(
//           question: "mmm?",
//           answers: ["a", "b", "c", "d"],
//           correctAnswerIndex: 2));

//   print(quizDb.allQuizzes["Kategorie 5"]);

//   printAllQuizzes(quizDb);

//   quizDb.displayQuizInfo(1);
//   quizDb.displayRightAnswer(1, 1);
//   quizDb.removeQuiz(1);
//   quizDb.displayQuizInfo(1);

//   print("----------------------------------------------------------------");
// }

// void printAllQuizzes(MockDatabaseQuizzes quizDb) {
//   quizDb.allQuizzes.forEach((category, quizzes) {
//     print('${category.name}:');
//     quizzes.forEach((id, quiz) {
//       print('  Quiz $id: ${quiz.question}');
//     });
//   });
// }
