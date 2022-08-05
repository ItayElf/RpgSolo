import 'package:flutter/material.dart';
import 'package:rpgsolo/components/sidebar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RpgSolo"),
        centerTitle: true,
      ),
      drawer: const SideBar(
        pageId: 0,
      ),
      body: Center(
        child: Text(
          "RpgSolo - Home",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
