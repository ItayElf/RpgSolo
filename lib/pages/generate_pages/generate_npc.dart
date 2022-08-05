import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/npc.dart';
import 'package:rpgsolo/data/races.dart';
import 'package:rpgsolo/generator/npc_generator.dart';
import 'package:rpgsolo/utils/extensions.dart';

class GenerateNpc extends StatelessWidget {
  const GenerateNpc({super.key});

  void onClick(Race? race) {
    Npc npc = NpcGenerator.generate(race);
    print(npc);
  }

  @override
  Widget build(BuildContext context) {
    final options = [null, ...Race.values];
    return Scaffold(
      appBar: AppBar(
        title: const Text("NPC Generator"),
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
                "Choose a Race:",
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
                    onClick(options[i]);
                  },
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
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
