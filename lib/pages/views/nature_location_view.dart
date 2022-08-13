import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/nature_location.dart';
import 'package:rpgsolo/components/tiles/encounter_tile.dart';
import 'package:rpgsolo/utils/extensions.dart';
import 'package:rpgsolo/utils/items_saver.dart';

class NatureLocationView extends StatefulWidget {
  const NatureLocationView({super.key, required this.location});

  final NatureLocation location;

  @override
  State<NatureLocationView> createState() => _NatureLocationViewState();
}

class _NatureLocationViewState extends State<NatureLocationView> {
  late List<NatureLocation> locations;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    ItemSaver.getSavedItems().then((value) {
      setState(() {
        locations = List.from(value["landscapes"]!);
        isSaved = value["landscapes"]!.contains(widget.location);
      });
    });
  }

  onClick() async {
    if (isSaved) {
      await ItemSaver.removeLandscape(widget.location);
    } else {
      await ItemSaver.saveLandsacpe(widget.location);
    }
    Map<String, List> value = await ItemSaver.getSavedItems();
    setState(() {
      locations = List.from(value["landscapes"]!);
      isSaved = value["landscapes"]!.contains(widget.location);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${widget.location.name.toTitleCase()} (${widget.location.type.name.toTitleCase()})"),
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
                    widget.location.name.toTitleCase(),
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
                "${widget.location.name.toTitleCase()} is a ${widget.location.type.name} located in the ${widget.location.direction} of the continent. "
                "This ${widget.location.type.name} is best known for ${widget.location.knownFor}. "
                "${widget.location.name.toTitleCase()} ${widget.location.weather}, ${widget.location.madeFrom} and ${widget.location.size}. "
                "${widget.location.name.toTitleCase()} is inhabited by ${widget.location.creature} and is ${widget.location.travelRate} traversed by travelers. "
                "A vlueable resource that can be found in ${widget.location.name.toTitleCase()} is ${widget.location.resource}.",
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
                itemCount: widget.location.encounters.length,
                itemBuilder: ((context, i) =>
                    EncounterTile(encounter: widget.location.encounters[i])),
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
