import 'package:flutter/material.dart';
import 'package:makhosandile_me/widgets/work/work_item.dart';

class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    // final viewPortHeight = MediaQuery.of(context).size.height;
    final viewPortWidth = MediaQuery.of(context).size.width;
    final padding = viewPortWidth * 0.08;
    final primaryPadding = EdgeInsets.all(padding);
    return Container(
      width: viewPortWidth,
      // constraints: BoxConstraints(minHeight: viewPortHeight),
      padding: primaryPadding.copyWith(top: padding / 3, bottom: padding / 3),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              "Work Section",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            // constraints: const BoxConstraints(maxWidth: 800.0),
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: List.generate(
                12,
                (index) => WorkItem(
                  title: index == 7 ? "Art direction" : null,
                  subTitle: index == 7
                      ? "This is a template Figma file, turned into code using Anima. Learn more at AnimaApp.com"
                      : null,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
