import 'package:flutter/material.dart';
import 'package:zen/screens/constants.dart';

class BlogCard extends StatefulWidget {
  BlogCard({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  State<BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                    "https://images.pexels.com/photos/3408744/pexels-photo-3408744.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              height: 50,
              width: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                color: SecondaryColor
              ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Text(
              widget.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
