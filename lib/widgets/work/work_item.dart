import 'package:flutter/material.dart';

class WorkItem extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const WorkItem({super.key, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 35.0),
        constraints: const BoxConstraints(maxWidth: 320, minWidth: 220),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// image
            Container(
              color: Colors.grey.shade200,
              child: const Image(
                image: AssetImage("assets/work_1.jpg"),
              ),
            ),

            /// title
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                title ?? "Title",
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            /// subtitle
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                subTitle ?? "Sub-Title",
                style: const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ));
  }
}
