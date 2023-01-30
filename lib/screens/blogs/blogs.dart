import 'package:flutter/material.dart';
import 'package:zen/screens/blogs/components/blog_card.dart';

class Blogs extends StatefulWidget {
  const Blogs({Key? key}) : super(key: key);

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  @override
  Widget build(BuildContext context) {

    List<String> blogs = ["Blog 1sjfd skf kj jn skfj nss flk", "Blog 2", "Blog 3"];
    return Scaffold(
      appBar: AppBar(title: Text("Blogs")),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Blog Category 1",
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: blogs.map((e) => BlogCard(title: e,)).toList(),
            ),
          )
        ],
      ),

    );
  }
}
