import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rpgsolo/classes/nature_location.dart';
import 'package:rpgsolo/components/tiles/encounter_tile.dart';
import 'package:rpgsolo/utils/extensions.dart';

class NatureLocationView extends StatelessWidget {
  const NatureLocationView({super.key, required this.location});

  final NatureLocation location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${location.name.toTitleCase()} (${location.type.name.toTitleCase()})"),
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
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: SelectableText(
                    location.name.toTitleCase(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
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
                "${location.name.toTitleCase()} is a ${location.type.name} located in the ${location.direction} of the continent. "
                "This ${location.type.name} is best known for ${location.knownFor}. "
                "${location.name.toTitleCase()} ${location.weather}, ${location.madeFrom} and ${location.size}. "
                "${location.name.toTitleCase()} is inhabited by ${location.creature} and is ${location.travelRate} traversed by travelers. "
                "A vlueable resource that can be found in ${location.name.toTitleCase()} is ${location.resource}.",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.justify,
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
                "Encounters:",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: location.encounters.length,
                itemBuilder: ((context, i) =>
                    EncounterTile(encounter: location.encounters[i])),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
