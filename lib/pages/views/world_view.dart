import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/god.dart';
import 'package:rpgsolo/classes/world.dart';
import 'package:rpgsolo/components/expandable_paragraph.dart';
import 'package:rpgsolo/components/tiles/nature_location_tile.dart';
import 'package:rpgsolo/components/tiles/npc_tile.dart';
import 'package:rpgsolo/components/tiles/town_tile.dart';
import 'package:rpgsolo/components/tiles/villain_tile.dart';
import 'package:rpgsolo/pages/views/god_view.dart';
import 'package:rpgsolo/utils/extensions.dart';
import 'package:rpgsolo/utils/items_saver.dart';

class WorldView extends StatefulWidget {
  const WorldView({super.key, required this.world});

  final World world;

  String getCulture() {
    return "The people of ${world.name.toTitleCase()} think that:\n"
        "${world.oppinions.keys.map((e) => "\u2022 ${e.toTitleCase()} are ${world.oppinions[e]!.toLowerCase()}.").join("\n")}";
  }

  @override
  State<WorldView> createState() => _WorldViewState();
}

class _WorldViewState extends State<WorldView> {
  late List<World> worlds;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    ItemSaver.getSavedItems().then((value) {
      setState(() {
        worlds = List.from(value["worlds"]!);
        isSaved = value["worlds"]!.contains(widget.world);
      });
    });
  }

  onClick() async {
    if (isSaved) {
      await ItemSaver.removeWorld(widget.world);
    } else {
      await ItemSaver.saveWorld(widget.world);
    }
    Map<String, List> value = await ItemSaver.getSavedItems();
    setState(() {
      worlds = List.from(value["worlds"]!);
      isSaved = value["worlds"]!.contains(widget.world);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text("${widget.world.name.toTitleCase()} (World)"),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: onClick,
              child: Icon(isSaved ? Icons.star : Icons.star_border),
            ),
          ),
        ],
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
                    widget.world.name.toTitleCase(),
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
              ExpandableParagraph(
                title: Text(
                  "Lore:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: SelectableText(
                  "In ${widget.world.name.toTitleCase()}, everybody knows that ${widget.world.loreItems[0].toLowerCase()}. "
                  "However, only very few people know that ${widget.world.loreItems[1].toLowerCase()}. "
                  "Almost nobody in ${widget.world.name.toTitleCase()} is aware to the fact that ${widget.world.loreItems[2].toLowerCase()}. "
                  "The peasants of ${widget.world.name.toTitleCase()} are sure that ${widget.world.loreItems[3].toLowerCase()}, "
                  "while the nobility believes that ${widget.world.loreItems[4].toLowerCase()}.",
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.justify,
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
              ExpandableParagraph(
                title: Text(
                  "Culture:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: SelectableText(
                  widget.getCulture(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(height: 1.25),
                  textAlign: TextAlign.start,
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
              ExpandableParagraph(
                title: Text(
                  "Gods:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children:
                      widget.world.gods.map((e) => GodSquare(god: e)).toList(),
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
              ExpandableParagraph(
                title: Text(
                  "Settlements:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.world.towns.length,
                  itemBuilder: (context, i) =>
                      TownTile(town: widget.world.towns[i]),
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
              ExpandableParagraph(
                title: Text(
                  "Landscape:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.world.terrain.length,
                  itemBuilder: (context, i) => NatureLocationTile(
                      natureLocation: widget.world.terrain[i]),
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
              ExpandableParagraph(
                title: Text(
                  "Villains:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.world.villains.length,
                  itemBuilder: (context, i) =>
                      VillainTile(villain: widget.world.villains[i]),
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
              ExpandableParagraph(
                title: Text(
                  "Important People:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.world.importantPeople.length,
                  itemBuilder: (context, i) =>
                      NpcTile(npc: widget.world.importantPeople[i]),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GodSquare extends StatelessWidget {
  const GodSquare({super.key, required this.god});

  final God god;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(SlideRoute(builder: (context) => GodView(god: god))),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.self_improvement,
                color: Theme.of(context).primaryColor,
                size: 36,
              ),
              Center(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    god.name.toTitleCase(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
              Center(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    god.alignment,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
