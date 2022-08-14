import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/nature_location.dart';
import 'package:rpgsolo/data/nature_location_data.dart';
import 'package:rpgsolo/pages/views/nature_location_view.dart';
import 'package:rpgsolo/utils/extensions.dart';

class NatureLocationTile extends StatelessWidget {
  const NatureLocationTile(
      {super.key, required this.natureLocation, this.onBack});

  final NatureLocation natureLocation;
  final Function? onBack;

  getIcon() {
    return {
          NatureLocationType.coast: Icons.water,
          NatureLocationType.sea: Icons.sailing,
          NatureLocationType.desert: Icons.wb_sunny,
          NatureLocationType.forest: Icons.forest,
        }[natureLocation.type] ??
        Icons.terrain;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.of(context)
            .push(SlideRoute(
                builder: (context) =>
                    NatureLocationView(location: natureLocation)))
            .then((value) => onBack != null ? onBack!() : null),
        leading: Icon(
          getIcon(),
          size: 36,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          natureLocation.name.toTitleCase(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        subtitle: Text(
          natureLocation.type.name.toTitleCase(),
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
