import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:zen/controllers/blogs_provider.dart';
import 'package:zen/models/blog_json.dart';
import 'package:zen/screens/constants.dart';

class BlogCard extends StatefulWidget {
  BlogCard({Key? key, required this.blog}) : super(key: key);

  BlogJson blog;

  @override
  State<BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  @override
  Widget build(BuildContext context) {
    bool isFetching = context.watch<BlogsProvider>().isFetching;
    print('isf, ${isFetching.toString()}');

    return isFetching ?
    SizedBox(
      width: 180,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 245,
          decoration: BoxDecoration(
            color: SecondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    )
        : SizedBox(
      width: 180,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    color: SecondaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  child: Center(
                    child: ClipRRect(
                      child: isFetching
                          ? CircularProgressIndicator()
                          : Image.network(
                              widget.blog.image,
                              fit: BoxFit.fill,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: LikeButton(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    size: 35,
                  ),
                ),
              ]),
            ),
            Container(
                height: 65,
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Color(0xFFB6D6F2),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 10,
                          color: Color(0xFFB6D6F2).withOpacity(0.4))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.blog.title,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
