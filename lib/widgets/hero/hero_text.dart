import 'package:flutter/material.dart';

class HeroText extends StatelessWidget {
  final TextAlign? alignment;
  const HeroText({super.key, this.alignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        ///
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text(
            "Flutter | VueJs | ReactJs | Laravel",
            style: const TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
            ),
            textAlign: alignment,
          ),
        ),

        ///
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text(
            "Front-end\nDeveloper",
            style: TextStyle(
              height: 1.1,
              fontSize: alignment == TextAlign.center ? 55 : 80,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
            ),
            textAlign: alignment,
          ),
        ),

        ///
        Container(
          padding: EdgeInsets.only(
            bottom: 30,
            right: 40,
            top: 0,
            left: alignment == TextAlign.center ? 40 : 0,
          ),
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            "Crafting beautiful and responsive digital experiences for the modern world.",
            style: const TextStyle(
              fontSize: 17,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
            textAlign: alignment,
          ),
        )
      ],
    );
  }
}
