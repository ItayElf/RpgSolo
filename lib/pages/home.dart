import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RpgSolo"),
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
