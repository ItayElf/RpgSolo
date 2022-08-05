import 'package:flutter/material.dart';
import 'package:rpgsolo/pages/Home.dart';
import 'package:rpgsolo/pages/roll_page.dart';
import 'package:rpgsolo/utils/extensions.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key, required this.pageId});

  final int pageId; // -1 for non main page

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Center(
              child: Text(
                "RpgSolo",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.auto_awesome,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "Generators",
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              if (pageId != 0) {
                Navigator.of(context).pushReplacement(
                    SlideRoute(builder: ((context) => const Home())));
              }
            },
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: 2,
          ),
          ListTile(
            leading: Icon(
              Icons.casino,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "Dice Roller",
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              if (pageId != 1) {
                Navigator.of(context).pushReplacement(
                    SlideRoute(builder: ((context) => const RollPage())));
              }
            },
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: 2,
          ),
          ListTile(
            leading: Icon(
              Icons.star,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "Saved Items",
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
