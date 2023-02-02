import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zen/models/blog_json.dart';

class FirebaseBlogsRepository {
  final db = FirebaseFirestore.instance;

  Future<void> addBlog(BlogJson newBlog) async {
    await db
        .collection("Blogs")
        .add(newBlog.toJson())
        .then((value) => print("Blogs Added"))
        .catchError((error) => print('Error:' + error));
  }

  Future<List<BlogJson>> getBlogsList() async {
    List<BlogJson> blogs = [];
    await db.collection("Blogs").get().then((event) {
      blogs =
          event.docs.map((e) => BlogJson.fromJson(e.data(), e.id)).toList();
    }).catchError((error) => print("Failed to fetch blogs. Error : ${error}"));
    return blogs;
  }


}