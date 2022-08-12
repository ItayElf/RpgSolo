import 'dart:math';

import 'package:rpgsolo/classes/npcs/relative.dart';
import 'package:rpgsolo/data/npcs/backstory_data.dart';
import 'package:rpgsolo/data/npcs/npc_data.dart';
import 'package:rpgsolo/data/races.dart';
import 'package:rpgsolo/generator/npcs/name_generator.dart';
import 'package:rpgsolo/utils/extensions.dart';

class RelativeGenerator {
  static Relative generate(
      String role, String surname, VillainRace race, String relativeAlignment,
      [bool? isMale, Random? random]) {
    Random rand = random ?? Random();
    bool male = isMale ?? rand.nextBool();
    String name =
        "${VillainRaceNameGenerator.generate(male, race, rand).split(" ")[0]} $surname";
    String alignment = _generateAlignment(relativeAlignment, rand);

    String occupation = rand.chooseFrom(occupations);
    String relationship = rand.chooseFrom(relationshipStatus);
    String status = rand.chooseFrom(relativeStatus);
    if (status == "dead") {
      status = rand
          .chooseFrom(deathCause)
          .replaceAll("BEVERB", "was")
          .replaceAll("REL", male ? "his" : "her");
    }
    Relative relative = Relative(
        name: name,
        isMale: male,
        role: role,
        alignment: alignment,
        occupation: occupation,
        relationship: relationship,
        status: status);
    return relative;
  }

  static String _generateAlignment(String relativeAlignment, Random random) {
    const ethical = ["Lawful", "True", "Chaotic"];
    const moral = ["Good", "Neutral", "Evil"];
    if (random.nextBool()) {
      return relativeAlignment.replaceAll(
          relativeAlignment.split(" ")[0], random.chooseFrom(ethical));
    }
    return relativeAlignment.replaceAll(
        relativeAlignment.split(" ")[1], random.chooseFrom(moral));
  }
}
