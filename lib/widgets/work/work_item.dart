import 'package:flutter/material.dart';
import 'package:makhosandile_me/theme.dart';
import 'package:makhosandile_me/widgets/utils/hover_focus.dart';

class WorkItem extends StatefulWidget {
  final String? title;
  final String? subTitle;
  final String? image;

  const WorkItem({
    super.key,
    this.title,
    this.subTitle,
    this.image,
  });

  @override
  State<WorkItem> createState() => _WorkItemState();
}

class _WorkItemState extends State<WorkItem> {
  ///
  late final tooltipKey =
      GlobalKey<TooltipState>(debugLabel: 'Tooltip${widget.title}');

  ///
  bool isHovered = false;

  ///
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(top: 40.0),
        decoration: const BoxDecoration(),
        constraints: const BoxConstraints(maxWidth: 320, minWidth: 220),
        child: HoverFocusContainer(
          onHover: (value) {
            if (mounted && value != isHovered) {
              setState(() {
                isHovered = value;
              });

              if (value) tooltipKey.currentState?.ensureTooltipVisible();
            }
          },
          onFocusChange: (value) {
            if (mounted && value != isHovered) {
              setState(() {
                isHovered = value;
              });

              if (value) tooltipKey.currentState?.ensureTooltipVisible();
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            transform: Matrix4.identity()..scale(isHovered ? 1.1 : 1.0),
            transformAlignment: Alignment.center,
            curve: Curves.easeInOut,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// image
                Container(
                  color: Colors.grey.shade200,
                  child: Image(
                    image: AssetImage(
                        "assets/${widget.image ?? "project_image"}.jpg"),
                  ),
                ),

                /// title
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12.0),
                  decoration: isHovered
                      ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: textColor),
                          ),
                        )
                      : null,
                  child: Text(
                    widget.title ?? "Title",
                    style: const TextStyle(
                      fontSize: 16,
                      height: 0.9,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                /// subtitle
                Tooltip(
                  key: tooltipKey,
                  triggerMode: TooltipTriggerMode.manual,
                  message: widget.subTitle,
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    height: 120,
                    decoration: const BoxDecoration(),
                    clipBehavior: Clip.hardEdge,
                    child: Text(
                      widget.subTitle ?? "Sub-Title",
                      style: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
