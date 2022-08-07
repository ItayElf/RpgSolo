import 'package:flutter/material.dart';
import 'package:rpgsolo/components/sidebar.dart';
import 'package:rpgsolo/utils/dice.dart';

class AskTheOracle extends StatefulWidget {
  const AskTheOracle({super.key});

  @override
  State<AskTheOracle> createState() => _AskTheOracleState();
}

class _AskTheOracleState extends State<AskTheOracle> {
  String? answer = "?";

  final odds = [
    "Almost Certain",
    "Likely",
    "Equaly Likely",
    "Unlikely",
    "Small Chance"
  ];
  final thresholds = [11, 26, 51, 76, 91];

  void onClick(int i) {
    setState(() {
      answer = null;
    });
    Dice d = Dice(diceCount: 1, diceSize: 100);
    int res = d.roll()[0];
    String ans = res >= thresholds[i] ? "Yes" : "No";
    if (res ~/ 10 == res % 10) {
      ans = "Exceptional $ans";
    }
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        setState(() {
          answer = ans;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ask the Oracle"),
        centerTitle: true,
      ),
      drawer: const SideBar(
        pageId: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Ask the Oracle",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Center(
              child: Text(
                "Choose the odds of the event:",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: odds.length,
              itemBuilder: ((context, i) => ElevatedButton(
                    onPressed: () {
                      onClick(i);
                    },
                    child: Text(
                      odds[i],
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.white),
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Answer:",
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline5,
            ),
            Center(
              child: answer != null
                  ? FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          answer ?? "",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(color: Colors.black),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 64,
                      width: 64,
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                        strokeWidth: 6,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
