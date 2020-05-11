class Book {
  final int userId;
  final int id;
  final String title;

  Book(this.userId, this.id, this.title);

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(json['userId'], json['id'], json['title']);
  }
}