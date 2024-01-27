import 'dart:math';

import 'package:flutter/material.dart';

import 'package:makhosandile_me/theme.dart';
import 'package:makhosandile_me/widgets/footer/footer_section.dart';
import 'package:makhosandile_me/widgets/hero/hero_section.dart';
import 'package:makhosandile_me/widgets/navbar/nav_bar.dart';
import 'package:makhosandile_me/widgets/story/story_section.dart';
import 'package:makhosandile_me/widgets/work/work_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const title = 'makhosandile.me';
    return MaterialApp(
      title: title,
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Scrollbar(
          controller: scrollController,
          child: ListView.builder(
            controller: scrollController,
            shrinkWrap: true,
            itemCount: _widgets.length,
            itemBuilder: (context, index) => _widgets[index],
          ),
        ),
      )),
    );
  }
}

const _widgets = [
  NavBar(),
  HeroSection(),
  StorySection(),
  WorkSection(),
  Footer(),
];

class Wrapper extends StatelessWidget {
  final Widget child;
  Wrapper({
    required this.child,
  }) : super(
          key: UniqueKey(),
        );

  @override
  Widget build(BuildContext context) {
    Color color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: color),
        ),
      ),
      child: child,
    );
  }
}
