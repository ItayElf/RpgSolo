import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/towns/location.dart';
import 'package:rpgsolo/components/npc_tile.dart';
import 'package:rpgsolo/data/towns/locations_type.dart';
import 'package:rpgsolo/utils/extensions.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key, required this.location});

  final Location location;

  String getDescription() {
    if (location.type == LocationType.monument ||
        location.type == LocationType.tower) {
      return location.description;
    }
    return "The ${location.type.printedName} \"${location.name.toTitleCase()}\" is located ${location.location}.\n\n ${location.name.toTitleCase()} ${location.description}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${location.name.toTitleCase()} (${location.type.printedName.toTitleCase()})"),
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
                child: SelectableText(
                  location.name.toTitleCase(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontWeight: FontWeight.bold),
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
                getDescription(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 8,
              ),
              Divider(
                color: Theme.of(context).primaryColorLight,
                thickness: 2,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                location.type == LocationType.monument ? "Artist:" : "Owner:",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              NpcTile(npc: location.owner),
            ],
          ),
        ),
      ),
    );
  }
}
