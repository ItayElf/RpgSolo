import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rpgsolo/classes/world.dart';
import 'package:rpgsolo/pages/views/world_view.dart';
import 'package:rpgsolo/utils/extensions.dart';

class WorldTile extends StatelessWidget {
  const WorldTile({super.key, required this.world, this.onBack});

  final World world;
  final Function? onBack;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.of(context)
            .push(SlideRoute(builder: (context) => WorldView(world: world)))
            .then((value) => onBack != null ? onBack!() : null),
        leading: Icon(
          Icons.public,
          size: 36,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          world.name.toTitleCase(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
