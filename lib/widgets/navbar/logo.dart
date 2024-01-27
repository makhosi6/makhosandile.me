import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      clipBehavior: Clip.none,
      child: Image.asset(
        "assets/logo.png",
      ),
    );
  }
}
