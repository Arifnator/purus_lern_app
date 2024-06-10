class Lexikon {
  int id;
  String title;
  String description;
  String category;
// kategorien eigene oberklassen + leexikon als map machen

  Lexikon({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
  });

  void displayLexikonInfo() {
    print('Lexikon: $title, Category: $category');
  }
}
