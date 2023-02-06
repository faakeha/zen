
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen/controllers/blogs_provider.dart';
import 'package:zen/screens/blogs/components/blog_category.dart';

class Blogs extends StatefulWidget {
  const Blogs({Key? key}) : super(key: key);

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async =>
    {
       await context.read<BlogsProvider>().setIsFetching(true),
       await context.read<BlogsProvider>().getBlogsList(),
       await context.read<BlogsProvider>().setIsFetching(false),
    });
    }

  @override
  Widget build(BuildContext context) {

    List<String> categories = context.watch<BlogsProvider>().categories;

    return Scaffold(
      appBar: AppBar(title: Text("Blogs")),
      body: ListView(
        children: categories.map((e) => BlogCategory(category: e,)).toList(),
      ),
    );
  }
}
