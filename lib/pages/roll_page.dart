import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rpgsolo/data/races.dart';
import 'package:rpgsolo/generator/physical_generator.dart';
import 'package:rpgsolo/utils/dice.dart';

class RollPage extends StatefulWidget {
  const RollPage({super.key});

  final List<int> diceSizes = const [2, 4, 6, 8, 10, 12, 20, 30, 100];

  @override
  State<RollPage> createState() => _RollPageState();
}

class _RollPageState extends State<RollPage> {
  int count = 1;
  TextEditingController diceSize = TextEditingController();
  int sum = 0;
  List<int> res = [];
  Dice d = Dice(diceCount: 0, diceSize: 0);

  void rollDice(int size) {
    d = Dice(diceCount: count, diceSize: size);
    List<int> rolled = d.roll();
    setState(() {
      res = rolled;
      sum = rolled.reduce((value, element) => value + element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dice Roller"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Text(
                "Choose Dice to Roll:",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        count = max(count - 1, 1);
                      });
                    },
                    onLongPress: () => setState(() {
                      count = 1;
                    }),
                    child: const Icon(Icons.exposure_minus_1_outlined),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      "$count D",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        count += 1;
                      });
                    },
                    onLongPress: () {
                      setState(() {
                        count += 5;
                      });
                    },
                    child: const Icon(Icons.plus_one),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 170,
              child: GridView.builder(
                itemCount: widget.diceSizes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 5 / 2,
                ),
                itemBuilder: (context, i) => ElevatedButton(
                  onPressed: () => {rollDice(widget.diceSizes[i])},
                  child: Text("D${widget.diceSizes[i]}"),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Sum: $sum (${d.diceCount}D${d.diceSize})\nResults: ${res.map((e) => e.toString()).join(", ")}",
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
    );
  }
}
