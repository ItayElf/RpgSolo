import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/npcs/npc.dart';
import 'package:rpgsolo/classes/npcs/relative.dart';
import 'package:rpgsolo/components/expandable_paragraph.dart';
import 'package:rpgsolo/components/relative_paragraph.dart';
import 'package:rpgsolo/utils/extensions.dart';

class NpcView extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final rels = getRelatives();
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text("${npc.name.toTitleCase()} (NPC)"),
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
                    npc.name.toTitleCase(),
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
                  "${npc.name.toTitleCase()} is a ${npc.age} years old ${npc.isMale ? 'male' : 'female'} ${npc.race.printedName} ${npc.occupation}. "
                  "${npc.pronoun.toTitleCase()} has a ${npc.physical.hair} and ${npc.physical.eyes}. "
                  "${npc.pronoun.toTitleCase()} has a ${npc.physical.skin}. "
                  "${npc.firstName.toTitleCase()} is ${npc.physical.height}cm tall and has a ${npc.physical.build}. "
                  "${npc.pronoun.toTitleCase()} has a ${npc.physical.face}. "
                  "${npc.pronoun.toTitleCase()} ${npc.physical.special}${npc.physical.special2 != null ? ' and ${npc.physical.special2}' : ''}.",
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
                  "${npc.name.toTitleCase()} ${npc.personality.trait1} ${npc.pronoun.toTitleCase()} ${npc.personality.trait2} "
                  "${npc.firstName.toTitleCase()} ${npc.personality.quirk1.replaceAll(".", "")} and ${npc.personality.quirk2} "
                  "${npc.pronoun.toTitleCase()} is ${npc.personality.alignment.toLowerCase()}.",
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
                  "${npc.name.toTitleCase()} ${npc.background.parents}. "
                  "${npc.pronoun.toTitleCase()} was born ${npc.background.birthplace}. "
                  "${npc.firstName.toTitleCase()} was raised ${npc.background.raisedBy}. "
                  "${npc.firstName.toTitleCase()} lived a ${npc.background.lifestyle} life and lived in ${npc.background.home}. "
                  "${npc.background.memory.toTitleCase(true)}. ",
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
                  "${npc.name.toTitleCase()} is ${npc.relationshipStatus}. ${npc.pronoun.toTitleCase()} is ${npc.orientation}.",
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
                    relatedName: npc.firstName,
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
                  "${npc.name.toTitleCase()} ${npc.hook}",
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
