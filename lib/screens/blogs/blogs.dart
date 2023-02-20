
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen/controllers/blogs_provider.dart';
import 'package:zen/models/blog_json.dart';
import 'package:zen/screens/blogs/components/blog_category.dart';
import 'package:zen/screens/constants.dart';

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
       //context.read<BlogsProvider>().setChangedCategories(),
       await context.read<BlogsProvider>().getBlogsList(),
       // await context.read<BlogsProvider>().getCategories(),
        await context.read<BlogsProvider>().setBlogs(),
       await context.read<BlogsProvider>().setIsFetching(false),
    });
    }

  @override
  Widget build(BuildContext context) {

    // List<String> categories = context.watch<BlogsProvider>().categories;
    Map<String, List<BlogJson>> list = context.watch<BlogsProvider>().flist;

    return Scaffold(
      appBar: AppBar(title: Text("Blogs")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: SecondaryColor,
                borderRadius: BorderRadius.circular(20)
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(horizontal: 90, vertical: 13)),
                onFieldSubmitted: (String text){
                  if(text != '') {
                    context.read<BlogsProvider>().setSearchItem(text);
                    context.read<BlogsProvider>().getFilteredBlogs();
                  }

                },
                onChanged: (String text){
                  if(text != '') {
                    context.read<BlogsProvider>().setSearchItem(text);
                     context.read<BlogsProvider>().getFilteredBlogs();
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: list.entries.map((e) => BlogCategory(category: e.key, blogs: e.value,)).toList()
            ),
          ),
        ],
      ),
    );
  }
}
