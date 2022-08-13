import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/encounter.dart';
import 'package:rpgsolo/utils/extensions.dart';
import 'package:rpgsolo/utils/items_saver.dart';

class EncounterView extends StatefulWidget {
  const EncounterView({super.key, required this.encounter});

  final Encounter encounter;

  @override
  State<EncounterView> createState() => _EncounterViewState();
}

class _EncounterViewState extends State<EncounterView> {
  late List<Encounter> encounters;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    ItemSaver.getSavedItems().then((value) {
      setState(() {
        encounters = List.from(value["encounters"]!);
        isSaved = value["encounters"]!.contains(widget.encounter);
      });
    });
  }

  onClick() async {
    if (isSaved) {
      await ItemSaver.removeEncounter(widget.encounter);
    } else {
      await ItemSaver.saveEncounter(widget.encounter);
    }
    Map<String, List> value = await ItemSaver.getSavedItems();
    setState(() {
      encounters = List.from(value["encounters"]!);
      isSaved = value["encounters"]!.contains(widget.encounter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.encounter.titleName.toTitleCase()} (Encounter)"),
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
                  widget.encounter.titleName.toTitleCase(),
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
              "The players encounter ${widget.encounter.encounter}${widget.encounter.description != "" ? " ${widget.encounter.description}" : ""} in the ${widget.encounter.locationType.name}. ${widget.encounter.benefit.toTitleCase(true)}",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: Theme.of(context).textTheme.headline6?.fontSize),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      )),
    );
  }
}
