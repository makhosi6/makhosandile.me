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
    "intro": "My development journey began over five years ago, ",
    "body":
        "and it’s been an exciting path of growth and learning. In 2021, I joined Quickloc8, where I worked on their flagship asset-tracking app using Flutter and Vue.js. I helped improve the app’s UI, data handling, and cross-platform compatibility to meet high performance standards in real-time location tracking."
  },
  {
    "intro": "In 2023, I transitioned to Teamgeek,",
    "body":
        "a developer-first company that supports continuous learning and collaboration. I became part of a team building a complex CRM system for an insurance client, using PHP/Laravel, Angular, Python, and SQL. I focused on implementing core business logic, backend APIs, and frontend components that helped streamline customer onboarding and claims workflows."
  },
  {
    "intro": "Away from the keyboard,",
    "body":
        "I cherish the moments spent with my family, grounding myself in the joy and support they provide. My passion for philosophy also offers a unique lens through which I view my work and the world, fostering a pursuit of wisdom and perspective. I also attend developer meetups and hackathons, like Indie Hackers and community civic tech events, where I connect with fellow developers, share knowledge, and explore new tools and ideas."
  },
];

