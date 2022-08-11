import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/encounter.dart';
import 'package:rpgsolo/pages/views/encounter_view.dart';
import 'package:rpgsolo/utils/extensions.dart';

class EncounterTile extends StatelessWidget {
  const EncounterTile({super.key, required this.encounter});

  final Encounter encounter;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (() => Navigator.of(context).push(SlideRoute(
          builder: (context) => EncounterView(encounter: encounter)))),
      leading: Icon(
        Icons.new_releases,
        size: 36,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        encounter.titleName.toTitleCase(),
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
