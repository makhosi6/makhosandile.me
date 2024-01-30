import 'package:flutter/material.dart';
import 'package:makhosandile_me/main.dart';
import 'package:makhosandile_me/theme.dart';

enum MenuItems { about, work, contact }

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => MenuState();
}

class MenuState extends State<Menu> {
  ///
  GlobalKey<dynamic> getMenuItemKey(MenuItems item) => switch (item) {
        MenuItems.about => storySectionKey,
        MenuItems.work => workSectionKey,
        MenuItems.contact => footerSectionKey
      };

  MenuItems? selectedMenu;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final viewPortWidth = MediaQuery.of(context).size.width;

        if (viewPortWidth < 800) {
          return PopupMenuButton<MenuItems>(
              surfaceTintColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 50,
              color: storyBgColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              initialValue: selectedMenu,
              onSelected: (MenuItems item) {
                if (mounted) {
                  setState(() {
                    selectedMenu = item;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const Image(
                  image: AssetImage("assets/menu.png"),
                ),
              ),
              itemBuilder: (BuildContext context) => MenuItems.values
                  .map(
                    (mItem) => PopupMenuItem<MenuItems>(
                      value: mItem,
                      onTap: () => getMenuItemKey(mItem)
                          .currentState
                          ?.scrollToWidget
                          ?.call(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                              child: Text(
                                mItem.name.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: storyColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList());
        }

        return Row(
          children: [
            InkWell(
              onTap: () => storySectionKey.currentState?.scrollToWidget?.call(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: const Text("About"),
              ),
            ),
            InkWell(
              onTap: () => workSectionKey.currentState?.scrollToWidget?.call(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: const Text("Work"),
              ),
            ),
            InkWell(
              onTap: () =>
                  footerSectionKey.currentState?.scrollToWidget?.call(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: const Text("Contact"),
              ),
            )
          ],
        );
      },
    );
  }
}
