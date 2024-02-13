import 'dart:math';

import 'package:flutter/material.dart';

import 'package:makhosandile_me/theme.dart';
import 'package:makhosandile_me/widgets/footer/footer_section.dart';
import 'package:makhosandile_me/widgets/hero/hero_section.dart';
import 'package:makhosandile_me/widgets/navbar/nav_bar.dart';
import 'package:makhosandile_me/widgets/story/story_section.dart';
import 'package:makhosandile_me/widgets/utils/scroll_controller_provider.dart';
import 'package:makhosandile_me/widgets/work/work_section.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(ScrollControllerProvider(child: const MyApp()));
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
      onGenerateRoute: (settings) {
        // settings.name        // When navigating to a non-defined route, redirect to home
        return MaterialPageRoute(builder: (context) => const MyHomePage());
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ///
  bool _isVisible = false;

  ///
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var scrollController =
        ScrollControllerProvider.of(context)?.scrollController;

    scrollController?.addListener(() {
      bool isVisible = scrollController.position.pixels > 300;
      if (mounted && _isVisible != isVisible) {
        setState(() {
          _isVisible = isVisible;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () => navBarSectionKey.currentState?.scrollToWidget?.call(),
        child: Align(
          alignment: const Alignment(0.9, 0.9),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: _isVisible ? 50 : 0,
            height: _isVisible ? 50 : 0,
            decoration: BoxDecoration(
              color: storyBgColor,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: storyColor,
              ),
            ),
            child: const Icon(
              Icons.keyboard_arrow_up_rounded,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
      ),
      body: Center(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Scrollbar(
          controller: ScrollControllerProvider.of(context)?.scrollController,
          child: SingleChildScrollView(
            controller: ScrollControllerProvider.of(context)?.scrollController,
            child: Column(
              children: List.generate(
                _widgets.length,
                (index) => _widgets[index],
              ),
            ),
          ),
        ),
      )),
    );
  }
}

final _widgets = [
  NavBar(
    glKey: navBarSectionKey,
  ),
  const HeroSection(
    key: Key('HeroSection'),
  ),
  StorySection(
    glKey: storySectionKey,
  ),
  WorkSection(
    glKey: workSectionKey,
  ),
  FooterSection(
    glKey: footerSectionKey,
  ),
];

final navBarSectionKey = GlobalKey<NavBarState>(debugLabel: "NavBarSectionKey");
final workSectionKey =
    GlobalKey<WorkSectionState>(debugLabel: "WorkSectionKey");
final storySectionKey =
    GlobalKey<StorySectionState>(debugLabel: "StorySectionKey");
final footerSectionKey =
    GlobalKey<FooterSectionState>(debugLabel: "FooterSectionKey");

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
