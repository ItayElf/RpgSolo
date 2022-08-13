import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/god.dart';
import 'package:rpgsolo/utils/extensions.dart';
import 'package:rpgsolo/utils/items_saver.dart';

class GodView extends StatefulWidget {
  const GodView({super.key, required this.god});

  final God god;

  @override
  State<GodView> createState() => _GodViewState();
}

class _GodViewState extends State<GodView> {
  late List<God> gods;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    ItemSaver.getSavedItems().then((value) {
      setState(() {
        gods = List.from(value["gods"]!);
        isSaved = value["gods"]!.contains(widget.god);
      });
    });
  }

  onClick() async {
    if (isSaved) {
      await ItemSaver.removeGod(widget.god);
    } else {
      await ItemSaver.saveGod(widget.god);
    }
    Map<String, List> value = await ItemSaver.getSavedItems();
    setState(() {
      gods = List.from(value["gods"]!);
      isSaved = value["gods"]!.contains(widget.god);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.god.name.toTitleCase()} (${widget.god.isMale ? "God" : "Goddess"})",
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
                    widget.god.name.toTitleCase(),
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
                "${widget.god.name.toTitleCase()} is the ${widget.god.isMale ? "god" : "goddess"} of ${widget.god.trait1}${widget.god.trait2 != null ? " and ${widget.god.trait2}" : ""}. "
                "${widget.god.isMale ? "He" : "She"} is ${widget.god.alignment}. "
                "${widget.god.name.toTitleCase()} is depicted as ${widget.god.depiction} and is worshiped by ${widget.god.race?.pluralName ?? "people from different races"}. "
                "${widget.god.name.toTitleCase()} has ${widget.god.worshippers} worshippers who are predominantly ${widget.god.occupation}s. "
                "Shrines and temples for ${widget.god.name.toTitleCase()} ${widget.god.shrines}. "
                "${widget.god.name.toTitleCase()} is often seen as ${widget.god.worshipSee} by people who worship ${widget.god.isMale ? "him" : "her"} and as ${widget.god.otherSee} by those who don't. ",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.justify,
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
