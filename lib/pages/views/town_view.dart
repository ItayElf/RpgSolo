import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/towns/town.dart';
import 'package:rpgsolo/components/expandable_paragraph.dart';
import 'package:rpgsolo/components/tiles/location_tile.dart';
import 'package:rpgsolo/components/tiles/npc_tile.dart';
import 'package:rpgsolo/utils/extensions.dart';
import 'package:rpgsolo/utils/items_saver.dart';

class TownView extends StatefulWidget {
  const TownView({super.key, required this.town});

  final Town town;

  @override
  State<TownView> createState() => _TownViewState();
}

class _TownViewState extends State<TownView> {
  late List<Town> towns;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    ItemSaver.getSavedItems().then((value) {
      setState(() {
        towns = List.from(value["settlements"]!);
        isSaved = value["settlements"]!.contains(widget.town);
      });
    });
  }

  onClick() async {
    if (isSaved) {
      await ItemSaver.removeSettlement(widget.town);
    } else {
      await ItemSaver.saveSettlement(widget.town);
    }
    Map<String, List> value = await ItemSaver.getSavedItems();
    setState(() {
      towns = List.from(value["settlements"]!);
      isSaved = value["settlements"]!.contains(widget.town);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${widget.town.name.toTitleCase()} (${widget.town.townType.name.toTitleCase()})"),
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
                    widget.town.name.toTitleCase(),
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
                  "Description:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: SelectableText(
                  widget.town.description,
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
                  "Sidequests:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.town.sidequests.length,
                  itemBuilder: (context, i) => Row(
                    children: [
                      Text(
                        "\u2022 ",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Flexible(
                        child: SelectableText(
                          widget.town.sidequests[i],
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      )
                    ],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
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
                  "Locations:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.town.locations.length,
                  itemBuilder: ((context, i) =>
                      LocationTile(location: widget.town.locations[i])),
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
                  "Npcs:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.town.npcs.length,
                  itemBuilder: ((context, i) =>
                      NpcTile(npc: widget.town.npcs[i])),
                ),
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
