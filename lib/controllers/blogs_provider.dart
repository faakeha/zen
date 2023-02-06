import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zen/models/blog_json.dart';
import 'package:zen/repositories/firebase_blogs_repository.dart';

class BlogsProvider with ChangeNotifier {
  final FirebaseBlogsRepository _blogsRepository = FirebaseBlogsRepository();
  List<BlogJson> _blogs = [];
  final List<String> _categories = [
    "Favourite",
    "General Information",
    "Helpful Tips to Manage Children",
    "Self-care Tips for Parents with ADHD Children",
    "ADHD Inattentive/Distracted Type",
    "ADHD Impulsive/Hyperactive Type",
    "ADHD Combined Type"
  ];
  List<BlogJson> _categoryBlogs = [];
  bool _isFetching = true;

  List<BlogJson> get blogs => _blogs;
  List<String> get categories => _categories;
  bool get isFetching => _isFetching;

  Future<void> setIsFetching(bool fetch) async {
    _isFetching = fetch;
    notifyListeners();
    print('heka '+ _isFetching.toString());
  }

  Future<void> addBlog() async {
    print('hello');
    BlogJson blog = BlogJson(
        title: "ADHD",
        category: "General",
        link: "https://www.healthline.com/health/adhd",
        image:
            "https://firebasestorage.googleapis.com/v0/b/project-zen-30a4c.appspot.com/o/images.jpg?alt=media&token=09353dd1-7135-4e59-a117-aa0eed73424a",
        likes: 10);
    await _blogsRepository.addBlog(blog);
    notifyListeners();
  }

  Future<void> launchInWebViewOrVC(Uri url) async {
    print('hello');
    if (!await launchUrl(
      url,
      mode: LaunchMode.platformDefault,
      webViewConfiguration: const WebViewConfiguration(),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> getBlogsList() async {
    _isFetching = true;
    notifyListeners();
    _blogs = await _blogsRepository.getBlogsList();
    // _isFetching = false;
    notifyListeners();
  }

  List<BlogJson> getCategoryBlogs(String category) {
    _categoryBlogs = _blogs.where((element) => element.category == category).toList();

    return _categoryBlogs;
  }
}
