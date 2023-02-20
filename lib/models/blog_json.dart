class BlogJson {
  String? id;
  String title;
  String category;
  String link;
  String image;
  int likes;

  BlogJson({
    this.id,
    required this.title,
    required this.category,
    required this.link,
    required this.image,
    required this.likes,
  });

  //const BlogJson.empty() : id = '', title = '', category = '', link = '', image = '', likes = 0;

  static BlogJson fromJson(Map<String, dynamic> json, String id) => BlogJson(
        id: id ?? '',
        title: json["title"] as String? ?? '',
        category: json["category"] as String? ?? '',
        link: json["link"] as String? ?? '',
        image: json["image"] as String? ?? '',
        likes: json["likes"] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "category": category,
        "link": link,
        "image": image,
        "likes": likes,
      };
}
