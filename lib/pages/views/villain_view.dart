import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/npcs/relative.dart';
import 'package:rpgsolo/classes/villains/villain.dart';
import 'package:rpgsolo/classes/villains/villain_action.dart';
import 'package:rpgsolo/components/expandable_paragraph.dart';
import 'package:rpgsolo/components/relative_paragraph.dart';
import 'package:rpgsolo/utils/extensions.dart';
import 'package:rpgsolo/utils/items_saver.dart';

class VillainView extends StatefulWidget {
  const VillainView({super.key, required this.villain});

  final Villain villain;

  getRelatives() {
    List<Relative> relatives = [];
    if (villain.background.mother != null) {
      relatives.add(villain.background.mother!);
      relatives.add(villain.background.father!);
    }
    return relatives + villain.background.sibilings;
  }

  @override
  State<VillainView> createState() => _VillainViewState();
}

class _VillainViewState extends State<VillainView> {
  late List<Villain> villains;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    ItemSaver.getSavedItems().then((value) {
      setState(() {
        villains = List.from(value["villains"]!);
        isSaved = value["villains"]!.contains(widget.villain);
      });
    });
  }

  onClick() async {
    if (isSaved) {
      await ItemSaver.removeVillain(widget.villain);
    } else {
      await ItemSaver.saveVillain(widget.villain);
    }
    Map<String, List> value = await ItemSaver.getSavedItems();
    setState(() {
      villains = List.from(value["villains"]!);
      isSaved = value["villains"]!.contains(widget.villain);
    });
  }

  @override
  Widget build(BuildContext context) {
    final rels = widget.getRelatives();
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text("${widget.villain.name.toTitleCase()} (Villain)"),
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
                  widget.villain.name.toTitleCase(),
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
                "${widget.villain.name.toTitleCase()} is a ${widget.villain.age} years old ${widget.villain.isMale ? 'male' : 'female'} ${widget.villain.race.printedName} ${widget.villain.occupation}. "
                "${widget.villain.pronoun.toTitleCase()} is ${widget.villain.power.printedName}. "
                "${widget.villain.pronoun.toTitleCase()} has a ${widget.villain.physical.hair} and ${widget.villain.physical.eyes}. "
                "${widget.villain.pronoun.toTitleCase()} has a ${widget.villain.physical.skin}. "
                "${widget.villain.firstName.toTitleCase()} is ${widget.villain.physical.height}cm tall and has a ${widget.villain.physical.build}. "
                "${widget.villain.pronoun.toTitleCase()} has a ${widget.villain.physical.face}. "
                "${widget.villain.pronoun.toTitleCase()} ${widget.villain.physical.special}${widget.villain.physical.special2 != null ? ' and ${widget.villain.physical.special2}' : ''}.",
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
                "${widget.villain.name.toTitleCase()} ${widget.villain.personality.trait1} ${widget.villain.pronoun.toTitleCase()} ${widget.villain.personality.trait2} "
                "${widget.villain.firstName.toTitleCase()} ${widget.villain.personality.quirk1.replaceAll(".", "")} and ${widget.villain.personality.quirk2} "
                "${widget.villain.pronoun.toTitleCase()} is ${widget.villain.personality.alignment.toLowerCase()}.",
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
                "Motives:",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              child: SelectableText(
                "${widget.villain.firstName.toTitleCase()}'s goal is to ${widget.villain.motives.goal}. ${widget.villain.pronoun.toTitleCase()} is motivated by ${widget.villain.motives.motivation}. "
                "${widget.villain.firstName.toTitleCase()}'s flaw is being ${widget.villain.motives.flaw} and ${widget.villain.relPronoun} weakness is ${widget.villain.motives.weakness}. "
                "${widget.villain.firstName.toTitleCase()} has ${widget.villain.motives.friends} friends, allies ${widget.villain.motives.allies} and special ties with ${widget.villain.motives.special}.",
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
                "${widget.villain.name.toTitleCase()} ${widget.villain.background.parents}. "
                "${widget.villain.pronoun.toTitleCase()} was born ${widget.villain.background.birthplace}. "
                "${widget.villain.firstName.toTitleCase()} was raised ${widget.villain.background.raisedBy}. "
                "${widget.villain.firstName.toTitleCase()} lived a ${widget.villain.background.lifestyle} life and lived in ${widget.villain.background.home}. "
                "${widget.villain.background.memory.toTitleCase(true)}. ",
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
                "${widget.villain.name.toTitleCase()} is ${widget.villain.relationshipStatus}. ${widget.villain.pronoun.toTitleCase()} is ${widget.villain.orientation}.",
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
                  relatedName: widget.villain.firstName,
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
                "Actions:",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.villain.actions.length,
                itemBuilder: (context, i) =>
                    ActionDataTile(action: widget.villain.actions[i]),
                separatorBuilder: (context, i) => const SizedBox(
                  height: 8,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      )),
    );
  }
}

class ActionDataTile extends StatelessWidget {
  const ActionDataTile({super.key, required this.action});

  final VillainAction action;

  Color getActionColor() {
    ActionResult res = action.result;
    if (res == ActionResult.victory) {
      return Colors.green;
    } else if (res == ActionResult.defeat) {
      return Colors.red;
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText.rich(
          TextSpan(
            text: "\u2022",
            style: Theme.of(context).textTheme.headline6,
            children: [
              TextSpan(
                  text: "${action.type.toTitleCase()} (",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontWeight: FontWeight.bold)),
              TextSpan(
                  text: action.result.name.toTitleCase(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: getActionColor())),
              const TextSpan(text: ")")
            ],
          ),
        ),
        SelectableText(
          "${action.actionDescription} ${action.resultDescription}",
          style: Theme.of(context).textTheme.bodyText1,
        )
      ],
    );
  }
}
