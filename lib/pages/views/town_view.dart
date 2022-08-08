import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/towns/town.dart';
import 'package:rpgsolo/components/location_tile.dart';
import 'package:rpgsolo/components/npc_tile.dart';
import 'package:rpgsolo/utils/extensions.dart';

class TownView extends StatelessWidget {
  const TownView({super.key, required this.town});

  final Town town;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${town.name.toTitleCase()} (${town.townType.name.toTitleCase()})"),
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
                    town.name.toTitleCase(),
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
                height: 8,
              ),
              SelectableText(
                town.description,
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
                "Sidequests:",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: town.sidequests.length,
                itemBuilder: (context, i) => Row(
                  children: [
                    Text(
                      "\u2022 ",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Flexible(
                      child: SelectableText(
                        town.sidequests[i],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )
                  ],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
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
                "Locations:",
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
                itemCount: town.locations.length,
                itemBuilder: ((context, i) =>
                    LocationTile(location: town.locations[i])),
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
                "Npcs:",
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
                itemCount: town.npcs.length,
                itemBuilder: ((context, i) => NpcTile(npc: town.npcs[i])),
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
