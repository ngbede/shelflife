// apps layout i.e bottomnavbar and drawers

import 'package:flutter/material.dart';
import 'package:shelflife/components/header_item.dart';
import 'package:shelflife/counts.dart';
import 'package:shelflife/deliveries.dart';
import 'package:shelflife/finances.dart';
import 'package:shelflife/home.dart';
import 'package:shelflife/products.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shelflife/utils/icons.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final List<Widget> _screens = [
    const Home(),
    const Products(),
    const Finances(),
    const Deliveries(),
    const Counts()
  ];

  int _index = 0;

  void changeScreen(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> appHeader = [
      {
        "widget": Center(
          child: Column(
            children: const [
              SizedBox(
                height: 20,
              ),
              Text(
                "shelf life",
                style: TextStyle(
                  color: Color(0XFF4D2999),
                ),
              ),
              Text(
                "Powered by Field Supply",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
        "title": ""
      },
      {
        "widget":
            HeaderItem(iconPath: svgIcons["products"]!, title: "Products"),
        "title": "Products"
      },
      {
        "widget":
            HeaderItem(iconPath: svgIcons["finances"]!, title: "Finances"),
        "title": "Finances"
      },
      {
        "widget":
            HeaderItem(iconPath: svgIcons["deliveries"]!, title: "Deliveries"),
        "title": "Deliveries"
      },
      {
        "widget": HeaderItem(iconPath: svgIcons["counts"]!, title: "Counts"),
        "title": "Counts"
      }
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          backgroundColor: const Color(0XFFFFFFFF),
          elevation: 1,
          titleSpacing: 0,
          title: appHeader[_index]["widget"],
          bottom: _index != 0
              ? PreferredSize(
                  child: Container(
                    margin: const EdgeInsets.only(left: 13, bottom: 10),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      appHeader[_index]["title"],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  preferredSize: const Size.fromHeight(20),
                )
              : null,
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFFD3D3D3), width: 1),
                    borderRadius: BorderRadius.circular(30)),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.menu,
                    color: Colors.grey,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0XFF4D2999),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _screens.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        type: BottomNavigationBarType.fixed,
        onTap: changeScreen,
        unselectedItemColor: const Color(0XFF666666),
        selectedItemColor: const Color(0XFF4D2999),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              svgIcons["home"]!,
              width: 23,
              color: _index == 0
                  ? const Color(0XFF4D2999)
                  : const Color(0XFF666666),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              svgIcons["products"]!,
              width: 20,
              color: _index == 1
                  ? const Color(0XFF4D2999)
                  : const Color(0XFF666666),
            ),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              svgIcons["finances"]!,
              width: 23,
              color: _index == 2
                  ? const Color(0XFF4D2999)
                  : const Color(0XFF666666),
            ),
            label: "Finances",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              svgIcons["deliveries"]!,
              width: 23,
              color: _index == 3
                  ? const Color(0XFF4D2999)
                  : const Color(0XFF666666),
            ),
            label: "Deliveries",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              svgIcons["counts"]!,
              width: 23,
              color: _index == 4
                  ? const Color(0XFF4D2999)
                  : const Color(0XFF666666),
            ),
            label: "Counts",
          ),
        ],
      ),
    );
  }
}
