import 'package:flutter/material.dart';
import 'package:rpgsolo/components/expandable_paragraph.dart';
import 'package:rpgsolo/components/sidebar.dart';
import 'package:rpgsolo/components/tiles/encounter_tile.dart';
import 'package:rpgsolo/components/tiles/god_tile.dart';
import 'package:rpgsolo/components/tiles/location_tile.dart';
import 'package:rpgsolo/components/tiles/nature_location_tile.dart';
import 'package:rpgsolo/components/tiles/npc_tile.dart';
import 'package:rpgsolo/components/tiles/town_tile.dart';
import 'package:rpgsolo/components/tiles/villain_tile.dart';
import 'package:rpgsolo/utils/items_saver.dart';

class SavedItems extends StatefulWidget {
  const SavedItems({super.key});

  @override
  State<SavedItems> createState() => _SavedItemsState();
}

class _SavedItemsState extends State<SavedItems> {
  Map<String, List>? saved;

  @override
  void initState() {
    super.initState();
    loadSavedData();
  }

  loadSavedData() async {
    final res = await ItemSaver.getSavedItems();
    setState(() {
      saved = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Items"),
        centerTitle: true,
      ),
      drawer: const SideBar(
        pageId: 3,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Center(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "Saved Items",
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
              Builder(
                builder: (context) {
                  if (saved == null) {
                    return Center(
                      child: SizedBox(
                        height: 64,
                        width: 64,
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                          strokeWidth: 6,
                        ),
                      ),
                    );
                  }
                  Map<String, List<dynamic>> data = saved!;
                  bool isEmpty = data.values.every((e) => e.isEmpty);
                  if (isEmpty) {
                    return Column(
                      children: [
                        Center(
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text("No Saved Items",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline5),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "Generate items and save them!",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.grey[600]),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      SavedParagraph(
                        isNotEmpty: data["npcs"]!.isNotEmpty,
                        title: "Npcs:",
                        count: data["npcs"]!.length,
                        builder: (context, i) => NpcTile(
                          npc: data["npcs"]![i],
                          onBack: loadSavedData,
                        ),
                      ),
                      SavedParagraph(
                        isNotEmpty: data["buildings"]!.isNotEmpty,
                        title: "Buildings:",
                        count: data["buildings"]!.length,
                        builder: (context, i) => LocationTile(
                          location: data["buildings"]![i],
                          onBack: loadSavedData,
                        ),
                      ),
                      SavedParagraph(
                        isNotEmpty: data["settlements"]!.isNotEmpty,
                        title: "Settlements:",
                        count: data["settlements"]!.length,
                        builder: (context, i) => TownTile(
                          town: data["settlements"]![i],
                          onBack: loadSavedData,
                        ),
                      ),
                      SavedParagraph(
                        isNotEmpty: data["villains"]!.isNotEmpty,
                        title: "Villains:",
                        count: data["villains"]!.length,
                        builder: (context, i) => VillainTile(
                          villain: data["villains"]![i],
                          onBack: loadSavedData,
                        ),
                      ),
                      SavedParagraph(
                        isNotEmpty: data["encounters"]!.isNotEmpty,
                        title: "Encounters:",
                        count: data["encounters"]!.length,
                        builder: (context, i) => EncounterTile(
                          encounter: data["encounters"]![i],
                          onBack: loadSavedData,
                        ),
                      ),
                      SavedParagraph(
                        isNotEmpty: data["landscapes"]!.isNotEmpty,
                        title: "Landscapes:",
                        count: data["landscapes"]!.length,
                        builder: (context, i) => NatureLocationTile(
                          natureLocation: data["landscapes"]![i],
                          onBack: loadSavedData,
                        ),
                      ),
                      SavedParagraph(
                        isNotEmpty: data["gods"]!.isNotEmpty,
                        title: "Gods:",
                        count: data["gods"]!.length,
                        builder: (context, i) => GodTile(
                          god: data["gods"]![i],
                          onBack: loadSavedData,
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SavedParagraph extends StatelessWidget {
  const SavedParagraph(
      {super.key,
      required this.isNotEmpty,
      required this.title,
      required this.count,
      required this.builder,
      this.divider = true});

  final bool isNotEmpty;
  final String title;
  final int count;
  final Widget Function(BuildContext, int) builder;
  final bool divider;

  @override
  Widget build(BuildContext context) {
    return isNotEmpty
        ? Column(
            children: [
              ExpandableParagraph(
                title: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: count,
                  itemBuilder: builder,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              divider
                  ? Divider(
                      color: Theme.of(context).primaryColorLight,
                      thickness: 2,
                    )
                  : Container(),
              SizedBox(
                height: divider ? 8 : 0,
              ),
            ],
          )
        : Container();
  }
}
