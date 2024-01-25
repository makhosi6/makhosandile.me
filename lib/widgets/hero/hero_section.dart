import 'package:flutter/material.dart';
import 'package:makhosandile_me/widgets/hero/hero_text.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    // const navBarHeight = 100;
    // final viewPortHeight = MediaQuery.of(context).size.height;
    final viewPortWidth = MediaQuery.of(context).size.width;
    final padding = viewPortWidth * 0.08;
    const spacing = 30.0;
    const verticalSpacing = spacing * 2;
    final isBiggerScreen = viewPortWidth > 1250;

    return Container(
      width: viewPortWidth,
      // constraints: BoxConstraints(minHeight: viewPortHeight - (navBarHeight)),
      padding: EdgeInsets.all(padding),
      child: Wrap(
        alignment:
            isBiggerScreen ? WrapAlignment.spaceBetween : WrapAlignment.center,
        runSpacing: verticalSpacing,
        children: [
          Container(
            width: (isBiggerScreen ? (viewPortWidth / 2) : viewPortWidth) -
                padding * (isBiggerScreen ? 2 : 1),
            // constraints: const BoxConstraints(
            // // minHeight: (viewPortHeight / 2) - (padding / 2),
            // ),
            child: HeroText(
              alignment: isBiggerScreen ? TextAlign.left : TextAlign.center,
            ),
          ),
          Container(
            width: (isBiggerScreen ? (viewPortWidth / 2) : viewPortWidth) -
                padding,
            constraints: BoxConstraints(maxWidth: isBiggerScreen ? 400 : 300),
            child: const Image(
              image: AssetImage("assets/hero-image.gif"),
            ),
          )
        ],
      ),
    );
  }
}
