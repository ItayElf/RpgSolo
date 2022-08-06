import 'package:flutter/material.dart';
import 'package:rpgsolo/components/sidebar.dart';
import 'package:rpgsolo/pages/generate_pages/generate_location.dart';
import 'package:rpgsolo/pages/generate_pages/generate_npc.dart';
import 'package:rpgsolo/utils/extensions.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Welcome to RpgSolo!",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  "What would you like to generate?",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GridView.count(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: const [
                  GeneratorButton(
                    title: "NPC",
                    moveTo: GenerateNpc(),
                  ),
                  GeneratorButton(
                    title: "Location",
                    moveTo: GenerateLocation(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GeneratorButton extends StatelessWidget {
  const GeneratorButton({super.key, required this.title, required this.moveTo});

  final String title;
  final Widget moveTo;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>
          Navigator.of(context).push(SlideRoute(builder: (context) => moveTo)),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
