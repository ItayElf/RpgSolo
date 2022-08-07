import 'package:flutter/material.dart';
import 'package:rpgsolo/pages/Home.dart';
import 'package:rpgsolo/pages/ask_the_oracle.dart';
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
          SideTile(
            pageId: pageId,
            title: "Generators",
            icon: Icons.auto_awesome,
            moveTo: const Home(),
            index: 0,
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: 1,
          ),
          SideTile(
            pageId: pageId,
            title: "Dice Roller",
            icon: Icons.casino,
            moveTo: const RollPage(),
            index: 1,
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: 1,
          ),
          SideTile(
            pageId: pageId,
            title: "Ask the Oracle",
            icon: Icons.self_improvement,
            moveTo: const AskTheOracle(),
            index: 2,
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: 1,
          ),
          SideTile(
            pageId: pageId,
            title: "Saved Items",
            icon: Icons.star,
            moveTo: null,
            index: 3,
          ),
        ],
      ),
    );
  }
}

class SideTile extends StatelessWidget {
  const SideTile({
    super.key,
    required this.pageId,
    required this.title,
    required this.icon,
    required this.moveTo,
    required this.index,
  });

  final int pageId;
  final int index;
  final String title;
  final IconData icon;
  final Widget? moveTo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      onTap: () {
        if (pageId != index && moveTo != null) {
          Navigator.of(context).pushReplacement(
              SlideRoute(builder: ((context) => moveTo as Widget)));
        }
      },
    );
  }
}
