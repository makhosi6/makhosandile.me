import 'package:flutter/material.dart';

class HoverFocusContainer extends StatelessWidget {
  final Function(bool) onHover;
  final Function(bool) onFocusChange;
  final Widget child;

  const HoverFocusContainer({
    Key? key,
    required this.onHover,
    required this.onFocusChange,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) => onFocusChange(hasFocus),
      child: MouseRegion(
        onEnter: (_) => onHover(true),
        onExit: (_) => onHover(false),
        child: child,
      ),
    );
  }
}
