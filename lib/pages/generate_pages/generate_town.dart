import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rpgsolo/classes/towns/town.dart';
import 'package:rpgsolo/data/towns/town_data.dart';
import 'package:rpgsolo/generator/town_generator.dart';
import 'package:rpgsolo/pages/views/town_view.dart';
import 'package:rpgsolo/utils/extensions.dart';

class GenerateTown extends StatelessWidget {
  const GenerateTown({super.key});

  void onClick(BuildContext context, TownType? type) {
    Town town = TownGenerator.generate(type);
    Navigator.push(
      context,
      SlideRoute(
        builder: (context) => TownView(town: town),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final options = [null, ...TownType.values];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settlement Generator"),
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
                "Choose a Settlement Size:",
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
                      options[i] == null
                          ? "Random"
                          : options[i]!.name.toTitleCase(),
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
          ],
        ),
      ),
    );
  }
}
