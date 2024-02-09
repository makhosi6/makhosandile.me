import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makhosandile_me/theme.dart';
import 'package:makhosandile_me/widgets/utils/scroll_to.dart';

class StorySection extends StatefulWidget {
  final GlobalKey<StorySectionState> glKey;
  const StorySection({required this.glKey}) : super(key: glKey);

  @override
  State<StorySection> createState() => StorySectionState();
}

class StorySectionState extends State<StorySection> with ScrollTo {
  ///
  void Function()? scrollToWidget;

  @override
  void initState() {
    super.initState();
    scrollToWidget = scrollToInvocation(context, widget.glKey);
  }

  @override
  Widget build(BuildContext context) {
    final viewPortWidth = MediaQuery.of(context).size.width;
    final padding = viewPortWidth * 0.08;
    final primaryPadding = EdgeInsets.all(padding);
    final isBiggerScreen = viewPortWidth > 1250;

    return Center(
      child: Container(
        width: viewPortWidth,
        constraints: BoxConstraints(
            maxWidth: isBiggerScreen ? double.infinity : viewPortWidth * 0.8),
        padding: isBiggerScreen
            ? primaryPadding.copyWith(
                top: padding / 4,
              )
            : null,
        child: Wrap(runSpacing: 10, children: [
          Container(
            constraints: BoxConstraints(
              minWidth: viewPortWidth / 0.7,
            ),
            child: Text(
              "My journey into the world of technology has been one of passion, dedication, and continuous learning. As a self-taught developer, I've embraced the challenges and rewards that come with mastering a craft from the ground up.",
              style: GoogleFonts.epilogue(
                fontSize: 24,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ...List.generate(
            stories.length,
            (index) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: storyBgColor,
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    stories[index]["intro"].toString(),
                    style: TextStyle(
                      color: storyColor,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    stories[index]["body"].toString(),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

final stories = [
  {
    "intro": "My development journey began five years ago, ",
    "body":
        "and since then, I've learned a great deal. In 2021, I joined Quickloc8, where I contributed to the development of their flagship app using Flutter and Vue.js. This cutting-edge application was designed to revolutionize asset tracking."
  },
  {
    "intro": "In 2023, I made a significant transition to Teamgeek. ",
    "body":
        "known for its developer-friendly environment/workplace, Teamgeek provides me with perfect platform to expand my technical portfolio. There, I immersed myself in various projects, utilizing my knowledge of JavaScript, Angular, PHP/Laravel, and Python. I delivered solutions that were not just code, but a blend of innovation, efficiency, and user-centric design."
  },
  {
    "intro": "Away from the keyboard,",
    "body":
        "I cherish the moments spent with my family, grounding myself in the joy and support they provide. My passion for philosophy also offers a unique lens through which I view my work and the world, fostering a pursuit of wisdom and perspective.",
  },
];
