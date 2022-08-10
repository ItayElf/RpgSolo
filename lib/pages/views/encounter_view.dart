import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/encounter.dart';
import 'package:rpgsolo/utils/extensions.dart';

class EncounterView extends StatelessWidget {
  const EncounterView({super.key, required this.encounter});

  final Encounter encounter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${encounter.titleName.toTitleCase()} (Encounter)"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Center(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: SelectableText(
                  encounter.titleName.toTitleCase(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 2,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Description:",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            SelectableText(
              "The players encounter ${encounter.encounter}${encounter.description != "" ? " ${encounter.description}" : ""} in the ${encounter.locationType.name}. ${encounter.benefit}",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: Theme.of(context).textTheme.headline6?.fontSize),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      )),
    );
  }
}
