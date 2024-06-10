import 'class_user.dart';
import 'class_lexikon.dart';
import 'class_quiz.dart';

void main() {
  User user = User(
    userName: "Maxi44",
    firstName: 'Max',
    lastName: 'Mustermann',
    email: 'max@example.com',
    password: 'password123',
    dateOfBirth: DateTime(1990, 1, 1),
    registrationDate: DateTime.now(),
  );

  Lexikon lexikon = Lexikon(
    id: 1,
    title: 'Anatomie',
    description:
        'Wissenschaft vom Bau des menschlichen Körpers und seiner Organe',
    category: 'Anatomie',
  );

  Quiz quiz = Quiz(
    id: 1,
    question: 'Wie viele Knochen hat der menschliche Körper?',
    answers: ['200', '206', '210', '215'],
    correctAnswerIndex: 1,
  );

  user.displayUserInfo();
  lexikon.displayLexikonInfo();
  quiz.displayQuizInfo();

  int userAnswer = 1;
  print("Benutzerantwort: ${quiz.answers[userAnswer]}");
  if (quiz.checkAnswer(userAnswer)) {
    print('Richtig!');
  } else {
    print('Falsch.');
  }
}
