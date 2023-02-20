import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen/controllers/blogs_provider.dart';
import 'package:zen/models/blog_json.dart';
import 'package:zen/screens/constants.dart';

import 'blog_card.dart';

class BlogCategory extends StatefulWidget {
   BlogCategory({Key? key, required this.category, required this.blogs}) : super(key: key);

  String category;
  List<BlogJson> blogs;

  @override
  State<BlogCategory> createState() => _BlogCategoryState();
}

class _BlogCategoryState extends State<BlogCategory> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async =>
    {

    });
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.category,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: widget.blogs
                  .map((e) => InkWell(
                onTap: (){
                  var url = Uri.parse(e.link);
                  context.read<BlogsProvider>().launchInWebViewOrVC(url);
                },
                child: BlogCard(
                  blog: e,
                ),
              ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
