import 'package:flutter/material.dart';

class ScrollControllerProvider extends InheritedWidget {
  ScrollControllerProvider({super.key, required this.child})
      : super(child: child);

  final ScrollController scrollController = ScrollController();

  ///
  BuildContext? workSectionContext;

  ///
  BuildContext? storySectionContext;

  ///
  BuildContext? footerSectionContext;

  @override
  final Widget child;

  static ScrollControllerProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ScrollControllerProvider>();
  }

  @override
  bool updateShouldNotify(ScrollControllerProvider oldWidget) {
    return true;
  }
}
