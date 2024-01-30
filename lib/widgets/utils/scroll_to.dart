import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:makhosandile_me/widgets/utils/scroll_controller_provider.dart';

mixin ScrollTo {
  void Function() scrollToInvocation(BuildContext? context, GlobalKey key) {
    return () {
      try {
        if (context != null) {
          final scrollController =
              ScrollControllerProvider.of(context)?.scrollController;

          final renderBox = context.findRenderObject() as RenderBox;
          //
          final offset = renderBox.localToGlobal(Offset.zero);
//
          scrollController?.animateTo(
            offset.dy,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      } catch (e) {
        if (kDebugMode) print(e);
      }
    };
  }
}
