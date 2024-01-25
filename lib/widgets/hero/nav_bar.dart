import 'package:flutter/material.dart';
import 'package:makhosandile_me/widgets/hero/logo.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Logo(), _Menu()],
      ),
    );
  }
}

enum MenuItems { about, work, contact }

class _Menu extends StatefulWidget {
  const _Menu();

  @override
  State<_Menu> createState() => _MenuState();
}

class _MenuState extends State<_Menu> {
  MenuItems? selectedMenu;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final viewPortWidth = MediaQuery.of(context).size.width;

        if (viewPortWidth < 800) {
          return PopupMenuButton<MenuItems>(
              elevation: 50,
              color: const Color.fromRGBO(30, 30, 30, 1),
              // color: const Color.fromARGB(242, 47, 47, 47),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              initialValue: selectedMenu,
              // Callback that sets the selected popup menu item.
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
                      value: MenuItems.work,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Row(
                          children: [
                            // Icon(
                            //   (mItem == MenuItems.contact)
                            //       ? Icons.contacts_rounded
                            //       : (mItem == MenuItems.about)
                            //           ? Icons.perm_contact_calendar_sharp
                            //           : Icons.work,
                            //   color: Colors.white70,
                            // ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                              child: Text(
                                mItem.name.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
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

        return const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Text("About"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Text("Work"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Text("Contact"),
            )
          ],
        );
      },
    );
  }
}
