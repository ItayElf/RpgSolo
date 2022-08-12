import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/npcs/relative.dart';
import 'package:rpgsolo/classes/villains/villain.dart';
import 'package:rpgsolo/classes/villains/villain_action.dart';
import 'package:rpgsolo/components/expandable_paragraph.dart';
import 'package:rpgsolo/components/relative_paragraph.dart';
import 'package:rpgsolo/utils/extensions.dart';

class VillainView extends StatelessWidget {
  const VillainView({super.key, required this.villain});

  final Villain villain;

  Color getActionColor(int i) {
    ActionResult action = villain.actions[i].result;
    if (action == ActionResult.victory) {
      return Colors.green;
    } else if (action == ActionResult.defeat) {
      return Colors.red;
    }
    return Colors.grey;
  }

  getRelatives() {
    List<Relative> relatives = [];
    if (villain.background.mother != null) {
      relatives.add(villain.background.mother!);
      relatives.add(villain.background.father!);
    }
    return relatives + villain.background.sibilings;
  }

  @override
  Widget build(BuildContext context) {
    final rels = getRelatives();
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text("${villain.name.toTitleCase()} (Villain)"),
        ),
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
                  villain.name.toTitleCase(),
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
                "${villain.name.toTitleCase()} is a ${villain.age} years old ${villain.isMale ? 'male' : 'female'} ${villain.race.printedName} ${villain.occupation}. "
                "${villain.pronoun.toTitleCase()} is ${villain.power.printedName}. "
                "${villain.pronoun.toTitleCase()} has a ${villain.physical.hair} and ${villain.physical.eyes}. "
                "${villain.pronoun.toTitleCase()} has a ${villain.physical.skin}. "
                "${villain.firstName.toTitleCase()} is ${villain.physical.height}cm tall and has a ${villain.physical.build}. "
                "${villain.pronoun.toTitleCase()} has a ${villain.physical.face}. "
                "${villain.pronoun.toTitleCase()} ${villain.physical.special}${villain.physical.special2 != null ? ' and ${villain.physical.special2}' : ''}.",
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
                "${villain.name.toTitleCase()} ${villain.personality.trait1} ${villain.pronoun.toTitleCase()} ${villain.personality.trait2} "
                "${villain.firstName.toTitleCase()} ${villain.personality.quirk1.replaceAll(".", "")} and ${villain.personality.quirk2} "
                "${villain.pronoun.toTitleCase()} is ${villain.personality.alignment.toLowerCase()}.",
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
                "${villain.firstName.toTitleCase()}'s goal is to ${villain.motives.goal}. ${villain.pronoun.toTitleCase()} is motivated by ${villain.motives.motivation}. "
                "${villain.firstName.toTitleCase()}'s flaw is being ${villain.motives.flaw} and ${villain.relPronoun} weakness is ${villain.motives.weakness}. "
                "${villain.firstName.toTitleCase()} has ${villain.motives.friends} friends, allies ${villain.motives.allies} and special ties with ${villain.motives.special}.",
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
                "${villain.name.toTitleCase()} ${villain.background.parents}. "
                "${villain.pronoun.toTitleCase()} was born ${villain.background.birthplace}. "
                "${villain.firstName.toTitleCase()} was raised ${villain.background.raisedBy}. "
                "${villain.firstName.toTitleCase()} lived a ${villain.background.lifestyle} life and lived in ${villain.background.home}. "
                "${villain.background.memory.toTitleCase(true)}. ",
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
                "${villain.name.toTitleCase()} is ${villain.relationshipStatus}. ${villain.pronoun.toTitleCase()} is ${villain.orientation}.",
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
                  relatedName: villain.firstName,
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
                itemCount: villain.actions.length,
                itemBuilder: (context, i) =>
                    ActionDataTile(action: villain.actions[i]),
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
