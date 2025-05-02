import 'package:flutter/material.dart';
import 'package:makhosandile_me/widgets/work/work_item.dart';

class Second extends StatefulWidget {
  final WorkItemData? workItemData;
  Second({super.key, required this.workItemData});

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(92, 110, 110, 110),
        body: Center(
          child: Container(
            color: Color.fromARGB(92, 110, 110, 110),
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            child: MouseRegion(
              onExit: (event) {
                Navigator.of(context).pop();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom:
                              BorderSide(color: Colors.grey.withOpacity(.3)),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Top Stories',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(.8)),
                                ),
                                const Text(
                                  'monday,june 8',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 17),
                                ),
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/${widget.workItemData?.image ?? "project_image"}.jpg"),
                                      )),
                                ),
                                Positioned(
                                  right: 1,
                                  top: 1,
                                  child: Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.white, width: 2)),
                                  ),
                                ),
                              ],
                            )
                            // ClipOval(child: Image.asset('assets/user.png',width: 59,))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey.withOpacity(.3)))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Hero(
                              tag:
                                  widget.workItemData?.title ?? "project_image",
                              child: Image.asset(
                                "assets/${widget.workItemData?.image ?? "project_image"}.jpg",
                                width: double.infinity,
                                height: 250,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, top: 24, bottom: 13),
                              child: Text(
                                'Top Stories Top StoriesTop StoriesTop Stories',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(.8)),
                              ),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                  "assets/${widget.workItemData?.image ?? "project_image"}.jpg",
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Hossin El ghazli',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  Text('31m ago',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                'sdfsdfsdfsdfsdfsf sdfsfsdfsdfsdfsdfsdf sfdsfdsfsdfdsfss  sfdsfdsfsdfsfdsdfsdfsdfsdfsdfsf sdfsfsdfsdfsdfsdfsdf sfdsfdsfsdfdsfss  sfdsfdsfsdfsfd',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "231",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.comment,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "231",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.red,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(32),
                                  child: Text(
                                    'data test new text for flutter app',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white.withOpacity(.2),
          selectedItemColor: Colors.red,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: Text('data').data),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: Text('data').data),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: Text('data').data),
          ],
        ));
  }
}

