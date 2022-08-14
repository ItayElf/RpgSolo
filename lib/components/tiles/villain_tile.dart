import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rpgsolo/classes/villains/villain.dart';
import 'package:rpgsolo/pages/views/villain_view.dart';
import 'package:rpgsolo/utils/extensions.dart';

class VillainTile extends StatelessWidget {
  const VillainTile({super.key, required this.villain, this.onBack});

  final Villain villain;
  final Function? onBack;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.of(context)
            .push(
                SlideRoute(builder: (context) => VillainView(villain: villain)))
            .then((value) => onBack != null ? onBack!() : null),
        leading: Icon(
          villain.isMale ? Icons.man : Icons.woman,
          size: 36,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          villain.name.toTitleCase(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        subtitle: Text(
          "${villain.isMale ? "Male" : "Female"} ${villain.race.printedName} ${villain.power.printedName.replaceAll("an ", "").replaceAll("a ", "")} ${villain.occupation}",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
