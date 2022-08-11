import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/god.dart';
import 'package:rpgsolo/generator/god_generator.dart';
import 'package:rpgsolo/pages/views/god_view.dart';
import 'package:rpgsolo/utils/extensions.dart';

class GenerateGod extends StatelessWidget {
  const GenerateGod({super.key});

  void onClick(BuildContext context, String? alignment) {
    God god = GodGenerator.generate(alignment);
    Navigator.push(
      context,
      SlideRoute(
        builder: (context) => GodView(god: god),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final options = [
      null,
      "Lawful Good",
      "True Good",
      "Chaotic Good",
      "Lawful Neutral",
      "True Neutral",
      "Chaotic Neutral",
      "Lawful Evil",
      "True Evil",
      "Chaotic Evil"
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("God Generator"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Text(
                "Choose an Alignment:",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.separated(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (context, i) => ElevatedButton(
                  onPressed: () => onClick(context, options[i]),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      options[i] == null ? "Random" : options[i]!.toTitleCase(),
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
                separatorBuilder: (BuildContext context, int i) =>
                    const SizedBox(
                  height: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
