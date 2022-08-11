import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/god.dart';
import 'package:rpgsolo/utils/extensions.dart';

class GodView extends StatelessWidget {
  const GodView({super.key, required this.god});

  final God god;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${god.name.toTitleCase()} (${god.isMale ? "God" : "Goddess"})",
        ),
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
                    god.name.toTitleCase(),
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
                "${god.name.toTitleCase()} is the ${god.isMale ? "god" : "goddess"} of ${god.trait1}${god.trait2 != null ? " and ${god.trait2}" : ""}. "
                "${god.isMale ? "He" : "She"} is ${god.alignment}. "
                "${god.name.toTitleCase()} is depicted as ${god.depiction} and is worshiped by ${god.race?.pluralName ?? "people from different races"}. "
                "${god.name.toTitleCase()} has ${god.worshippers} worshippers who are predominantly ${god.occupation}s. "
                "Shrines and temples for ${god.name.toTitleCase()} ${god.shrines}. "
                "${god.name.toTitleCase()} is often seen as ${god.worshipSee} by people who worship ${god.isMale ? "him" : "her"} and as ${god.otherSee} by those who don't. ",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
