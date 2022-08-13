import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/god.dart';
import 'package:rpgsolo/pages/views/god_view.dart';
import 'package:rpgsolo/utils/extensions.dart';

class GodTile extends StatelessWidget {
  const GodTile({super.key, required this.god, this.onBack});

  final God god;
  final Function? onBack;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.of(context)
            .push(SlideRoute(builder: (context) => GodView(god: god)))
            .then((value) => onBack != null ? onBack!() : null),
        leading: Icon(
          Icons.self_improvement,
          size: 36,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          god.name.toTitleCase(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        subtitle: Text(
          "${god.isMale ? "God" : "Goddess"} of ${god.trait1}${god.trait2 != null ? " and ${god.trait2}" : ""}",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
