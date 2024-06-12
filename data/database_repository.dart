import '../models/category.dart';
import '../models/lexicon.dart';
import '../models/quiz.dart';
import '../models/user.dart';

abstract class DatabaseRepositoryCategories {
  void addCategory(int id, Category category);
  void removeCategory(int id);
  void displayCategory(int id);
}

abstract class DatabaseRepositoryLexica {
  void addLexicon(Lexicon lexicon);
  void removeLexicon(int id);
  void displayLexicon(int id);
}

abstract class DatabaseRepositoryQuizzes {
  void addQuiz(Quiz quiz);
  void removeQuiz(int id);
  void displayQuizInfo(int id);
  void displayRightAnswer(int id, int userAnswerIndex);
}

abstract class DatabaseRepositoryUsers {
  void addUser(String id, User user);
  void removeUser(String id);
  void displayUserInfo(String id);
}
