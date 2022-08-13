import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/npcs/npc.dart';
import 'package:rpgsolo/classes/npcs/relative.dart';
import 'package:rpgsolo/components/expandable_paragraph.dart';
import 'package:rpgsolo/components/relative_paragraph.dart';
import 'package:rpgsolo/utils/extensions.dart';
import 'package:rpgsolo/utils/items_saver.dart';

class NpcView extends StatefulWidget {
  const NpcView({super.key, required this.npc});

  final Npc npc;

  getRelatives() {
    List<Relative> relatives = [];
    if (npc.background.mother != null) {
      relatives.add(npc.background.mother!);
      relatives.add(npc.background.father!);
    }
    return relatives + npc.background.sibilings;
  }

  @override
  State<NpcView> createState() => _NpcViewState();
}

class _NpcViewState extends State<NpcView> {
  late List<Npc> npcs;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    ItemSaver.getSavedItems().then((value) {
      setState(() {
        npcs = List.from(value["npcs"]!);
        isSaved = value["npcs"]!.contains(widget.npc);
      });
    });
  }

  onClick() async {
    if (isSaved) {
      await ItemSaver.removeNpc(widget.npc);
    } else {
      await ItemSaver.saveNpc(widget.npc);
    }
    Map<String, List> value = await ItemSaver.getSavedItems();
    setState(() {
      npcs = List.from(value["npcs"]!);
      isSaved = value["npcs"]!.contains(widget.npc);
    });
  }

  @override
  Widget build(BuildContext context) {
    final rels = widget.getRelatives();
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text("${widget.npc.name.toTitleCase()} (NPC)"),
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
                    widget.npc.name.toTitleCase(),
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
                  "${widget.npc.name.toTitleCase()} is a ${widget.npc.age} years old ${widget.npc.isMale ? 'male' : 'female'} ${widget.npc.race.printedName} ${widget.npc.occupation}. "
                  "${widget.npc.pronoun.toTitleCase()} has a ${widget.npc.physical.hair} and ${widget.npc.physical.eyes}. "
                  "${widget.npc.pronoun.toTitleCase()} has a ${widget.npc.physical.skin}. "
                  "${widget.npc.firstName.toTitleCase()} is ${widget.npc.physical.height}cm tall and has a ${widget.npc.physical.build}. "
                  "${widget.npc.pronoun.toTitleCase()} has a ${widget.npc.physical.face}. "
                  "${widget.npc.pronoun.toTitleCase()} ${widget.npc.physical.special}${widget.npc.physical.special2 != null ? ' and ${widget.npc.physical.special2}' : ''}.",
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
                  "Personality:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: SelectableText(
                  "${widget.npc.name.toTitleCase()} ${widget.npc.personality.trait1} ${widget.npc.pronoun.toTitleCase()} ${widget.npc.personality.trait2} "
                  "${widget.npc.firstName.toTitleCase()} ${widget.npc.personality.quirk1.replaceAll(".", "")} and ${widget.npc.personality.quirk2} "
                  "${widget.npc.pronoun.toTitleCase()} is ${widget.npc.personality.alignment.toLowerCase()}.",
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
                  "Background:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: SelectableText(
                  "${widget.npc.name.toTitleCase()} ${widget.npc.background.parents}. "
                  "${widget.npc.pronoun.toTitleCase()} was born ${widget.npc.background.birthplace}. "
                  "${widget.npc.firstName.toTitleCase()} was raised ${widget.npc.background.raisedBy}. "
                  "${widget.npc.firstName.toTitleCase()} lived a ${widget.npc.background.lifestyle} life and lived in ${widget.npc.background.home}. "
                  "${widget.npc.background.memory.toTitleCase(true)}. ",
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
                  "Relationship:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: SelectableText(
                  "${widget.npc.name.toTitleCase()} is ${widget.npc.relationshipStatus}. ${widget.npc.pronoun.toTitleCase()} is ${widget.npc.orientation}.",
                  style: Theme.of(context).textTheme.bodyText1,
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
                  "Relatives:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: rels.length,
                  itemBuilder: (context, i) => RelativeParagraph(
                    relative: rels[i],
                    relatedName: widget.npc.firstName,
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
                  "Plot Hook:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: SelectableText(
                  "${widget.npc.name.toTitleCase()} ${widget.npc.hook}",
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.justify,
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
