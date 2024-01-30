import 'package:flutter/material.dart';
import 'package:makhosandile_me/widgets/navbar/logo.dart';
import 'package:makhosandile_me/widgets/navbar/menu.dart';
import 'package:makhosandile_me/widgets/utils/scroll_to.dart';

class NavBar extends StatefulWidget {
  final GlobalKey<NavBarState> glKey;
  const NavBar({required this.glKey}) : super(key: glKey);

  @override
  State<NavBar> createState() => NavBarState();
}

class NavBarState extends State<NavBar> with ScrollTo {
  ///
  void Function()? scrollToWidget;

  @override
  void initState() {
    super.initState();
    scrollToWidget = scrollToInvocation(context, widget.glKey);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80.0,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Logo(),
          Menu(),
        ],
      ),
    );
  }
}
