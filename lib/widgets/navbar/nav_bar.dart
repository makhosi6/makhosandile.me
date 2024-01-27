import 'package:flutter/material.dart';
import 'package:makhosandile_me/widgets/navbar/logo.dart';
import 'package:makhosandile_me/widgets/navbar/menu.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

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
