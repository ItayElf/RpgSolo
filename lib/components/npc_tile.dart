import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/npcs/npc.dart';
import 'package:rpgsolo/pages/views/npc_view.dart';
import 'package:rpgsolo/utils/extensions.dart';

class NpcTile extends StatelessWidget {
  const NpcTile({super.key, required this.npc});

  final Npc npc;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (() => Navigator.of(context)
          .push(SlideRoute(builder: (context) => NpcView(npc: npc)))),
      leading: Icon(
        Icons.person,
        size: 36,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        npc.name.toTitleCase(),
        style: Theme.of(context).textTheme.subtitle1,
      ),
      subtitle: Text(
        "${npc.isMale ? "Male" : "Female"} ${npc.race.printedName} ${npc.occupation}",
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
