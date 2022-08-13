import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/towns/town.dart';
import 'package:rpgsolo/pages/views/town_view.dart';
import 'package:rpgsolo/utils/extensions.dart';

class TownTile extends StatelessWidget {
  const TownTile({super.key, required this.town, this.onBack});

  final Town town;
  final Function? onBack;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.of(context)
            .push(SlideRoute(builder: (context) => TownView(town: town)))
            .then((value) => onBack != null ? onBack!() : null),
        leading: Icon(
          Icons.location_city,
          size: 36,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          town.name.toTitleCase(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        subtitle: Text(
          "${town.townType.name.toTitleCase()} of ${town.mainRace.pluralName}",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
