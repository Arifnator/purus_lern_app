import 'models/category.dart';
import 'models/lexicon.dart';
import 'models/user.dart';
import 'models/quiz.dart';
import "data/database_repository.dart";
import "data/mock_database.dart";

void main() {
  DatabaseRepositoryQuizzes q1 = MockDatabaseQuizzes();
  q1.addQuiz(Quiz(
      question: "jjj?",
      answers: ["aa", "bb", "cc", "dd"],
      correctAnswerIndex: 0));

  q1.displayQuizInfo(1);
  q1.displayRightAnswer(1, 1);
}

// gercek quiz yap