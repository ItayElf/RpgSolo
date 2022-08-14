import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/towns/location.dart';
import 'package:rpgsolo/data/towns/locations_data.dart';
import 'package:rpgsolo/pages/views/location_view.dart';
import 'package:rpgsolo/utils/extensions.dart';

class LocationTile extends StatelessWidget {
  const LocationTile({super.key, required this.location, this.onBack});

  final Location location;
  final Function? onBack;

  getIcon() {
    return {
          LocationType.armory: Icons.security,
          LocationType.generalStore: Icons.storefront,
          LocationType.guildhall: Icons.home_filled,
          LocationType.library: Icons.auto_stories,
          LocationType.smithy: Icons.hardware,
          LocationType.tavern: Icons.sports_bar,
          LocationType.tower: Icons.wb_shade,
          LocationType.temple: Icons.temple_buddhist,
          LocationType.weaponry: Icons.store_mall_directory,
        }[location.type] ??
        Icons.place;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.of(context)
            .push(SlideRoute(
                builder: (context) => LocationView(location: location)))
            .then((value) => onBack != null ? onBack!() : null),
        leading: Icon(
          getIcon(),
          size: 36,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          location.name.toTitleCase(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        subtitle: Text(
          location.type.printedName.toTitleCase(),
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
