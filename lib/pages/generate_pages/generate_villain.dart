import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rpgsolo/classes/villains/villain.dart';
import 'package:rpgsolo/data/villains/villain_data.dart';
import 'package:rpgsolo/generator/villains/villain_generator.dart';
import 'package:rpgsolo/pages/views/villain_view.dart';
import 'package:rpgsolo/utils/extensions.dart';

class GenerateVillain extends StatelessWidget {
  const GenerateVillain({super.key});

  void onClick(BuildContext context, VillainPower? power) {
    Villain villain = VillainGenerator.generate(power);
    Navigator.push(
      context,
      SlideRoute(
        builder: (context) => VillainView(villain: villain),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final options = [null, ...VillainPower.values];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Villain Generator"),
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
                "Choose a Power Level:",
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
                  onPressed: () {
                    onClick(context, options[i]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      options[i] == null
                          ? "Random"
                          : options[i]!
                              .printedName
                              .toTitleCase()
                              .split(" ")
                              .sublist(1)
                              .join(" "),
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
