import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/towns/location.dart';
import 'package:rpgsolo/pages/views/location_view.dart';
import 'package:rpgsolo/utils/extensions.dart';

class LocationTile extends StatelessWidget {
  const LocationTile({super.key, required this.location});

  final Location location;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (() => Navigator.of(context).push(
          SlideRoute(builder: (context) => LocationView(location: location)))),
      leading: Icon(
        Icons.place,
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
    );
  }
}
