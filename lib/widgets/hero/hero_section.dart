import 'package:flutter/material.dart';
import 'package:makhosandile_me/widgets/hero/hero_text.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewPortWidth = MediaQuery.of(context).size.width;
    final padding = viewPortWidth * 0.08;
    const spacing = 30.0;
    const verticalSpacing = spacing * 2;
    final isBiggerScreen = viewPortWidth > 1250;

    return Container(
      width: viewPortWidth,
      padding: EdgeInsets.all(padding),
      child: Wrap(
        alignment:
            isBiggerScreen ? WrapAlignment.spaceBetween : WrapAlignment.center,
        runSpacing: verticalSpacing,
        children: [
          Container(
            width: (isBiggerScreen ? (viewPortWidth / 2) : viewPortWidth) -
                padding * (isBiggerScreen ? 2 : 1),
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
