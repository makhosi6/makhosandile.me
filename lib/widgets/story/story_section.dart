import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makhosandile_me/theme.dart';

class StorySection extends StatelessWidget {
  const StorySection({super.key});

  @override
  Widget build(BuildContext context) {
    // final viewPortHeight = MediaQuery.of(context).size.height;
    final viewPortWidth = MediaQuery.of(context).size.width;
    final padding = viewPortWidth * 0.08;
    final primaryPadding = EdgeInsets.all(padding);
    final isBiggerScreen = viewPortWidth > 1250;

    return Center(
      child: Container(
        width: viewPortWidth,
        constraints: BoxConstraints(
            // minHeight: viewPortHeight / 2,
            // maxHeight: viewPortHeight,
            maxWidth: isBiggerScreen ? double.infinity : viewPortWidth * 0.8),
        padding: primaryPadding.copyWith(top: padding / 2),
        child: Wrap(runSpacing: 40, children: [
          // Flexible(
          //   child:
          Container(
            constraints: BoxConstraints(
              minWidth: viewPortWidth / 0.7,
            ),
            child: Text(
              "When I was 5, I got adbucted by a unicorn family. When they returned me to earth, I joined a designer school. But, for real, what I learned with my kidnaptive family really gave an edge to my creative language.",
              style: GoogleFonts.epilogue(
                fontSize: 24,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
              ),
            ),
            // ),
          ),
          // Flexible(
          //     child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: storyBgColor,
                padding: const EdgeInsets.all(4),
                child: Text(
                  " Being a human is way too complicated. Time to be a unicorn.",
                  style: TextStyle(
                    color: storyColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                child: const Text(
                    "Try it and you’ll see. Then your Figma files are just gonna fly in color, glitter, interactions and autolayout."),
              ),
              Container(
                color: storyBgColor,
                padding: const EdgeInsets.all(4),
                child: Text(
                  " Being a human is way too complicated. Time to be a unicorn.",
                  style: TextStyle(
                    color: storyColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                child: const Text(
                    "Available for projects, from Monday to Tuesday, mainy between 14 and 16. (Unless there is a unicorn race on TV - DUH -in that case, come back another day). \nProjects include, RocknRoll covers, furniture refurbishing, Unicorn potty training and more."),
              )
            ],
          ),
          // ),
        ]),
      ),
    );
  }
}
