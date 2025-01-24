class BlogModel {
  final int id;
  final String title;
  final String category;
  final String author;
  final String anticipated;
  final String body;
  final String image;
  final String createdAt;
  final String updatedAt;

  BlogModel({
    required this.id,
    required this.title,
    required this.category,
    required this.author,
    required this.anticipated,
    required this.body,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

    factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      author: json['author'],
      anticipated: json['anticipated'],
      body: json['body'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      );
    }
}