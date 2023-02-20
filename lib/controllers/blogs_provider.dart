import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zen/models/blog_json.dart';
import 'package:zen/repositories/firebase_blogs_repository.dart';

class BlogsProvider with ChangeNotifier {
  final FirebaseBlogsRepository _blogsRepository = FirebaseBlogsRepository();

  List<BlogJson> _blogs = [];
   List<String> _categories = [
    "Favourites",
    "General Information",
    "Helpful Tips to Manage Children",
    "Self-care Tips for Parents with ADHD Children",
    "ADHD Inattentive/Distracted Type",
    "ADHD Impulsive/Hyperactive Type",
    "ADHD Combined Type"
  ];
  bool _isFetching = true;
  String _searchText = '';
  Map<String, List<BlogJson>> _list = {};
  Map<String, List<BlogJson>> _flist = {};

  List<BlogJson> get blogs => _blogs;
  bool get isFetching => _isFetching;
  String get searchText => _searchText;
  List<String> get categories => _categories;
  Map<String, List<BlogJson>> get list => _list;
  Map<String, List<BlogJson>> get flist => _flist;

  Future<void> setIsFetching(bool fetch) async {
    _isFetching = fetch;
    notifyListeners();
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

  void setSearchItem(String text) {
    _searchText = text;
    notifyListeners();
  }

  setBlogs(){
    for(var item in _categories){
      _list[item] = _blogs.where((element) => element.category == item).toList();
    }
    _flist = _list;
    notifyListeners();
  }

  getFilteredBlogs() {
    Map<String, List<BlogJson>> filteredMap = {};

    for(var item in _list.entries){
      if(item.value.where((element) => element.title.toLowerCase().contains(searchText.toLowerCase())).toList().isNotEmpty){
        filteredMap[item.key] = item.value.where((element) => element.title.toLowerCase().contains(searchText.toLowerCase())).toList();
      }
    }

    _flist = filteredMap;
    notifyListeners();

  }
}
