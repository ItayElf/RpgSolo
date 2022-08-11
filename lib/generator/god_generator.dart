import 'dart:math';

import 'package:rpgsolo/classes/god.dart';
import 'package:rpgsolo/data/god_data.dart';
import 'package:rpgsolo/data/npcs/npc_data.dart';
import 'package:rpgsolo/data/races.dart';
import 'package:rpgsolo/generator/npcs/name_generator.dart';
import 'package:rpgsolo/utils/extensions.dart';

class GodGenerator {
  static God generate([String? alignment, Random? random]) {
    Random rand = random ?? Random();
    String align = alignment ?? _generateAlignment(rand);
    bool isMale = rand.nextBool();
    String trait1 = _generateTrait(align, rand);
    String? trait2;
    if (rand.nextBool()) {
      trait2 = _generateTrait(align, rand);
      while (trait2 == trait1) {
        trait2 = _generateTrait(align, rand);
      }
    }
    VillainRace? race = _generateRace(align, rand);
    String depiction = _generateDepiction(race, rand);
    String worshippers = rand.chooseFrom(godWorshippers);
    String occupation = rand.chooseFrom(occupations);
    String shrines = rand.chooseFrom(godShrines);
    String otherSee = rand.chooseFrom(godOtherSee + godWorshippersSee);
    String worshipSee = rand.chooseFrom(godWorshippersSee);
    String name =
        VillainRaceNameGenerator.generate(isMale, race, random).split(" ")[0];
    God god = God(
        name: name,
        isMale: isMale,
        trait1: trait1,
        trait2: trait2,
        alignment: align,
        depiction: depiction,
        race: race,
        worshippers: worshippers,
        occupation: occupation,
        shrines: shrines,
        otherSee: otherSee,
        worshipSee: worshipSee);
    return god;
  }

  static String _generateAlignment(Random random) {
    return "${random.chooseFrom([
          "Lawful",
          "True",
          "Chaotic"
        ])} ${random.chooseFrom(["Evil", "Neutral", "Good"])}";
  }

  static String _generateTrait(String alignment, Random random) {
    List<String> pool = List.from(godTrueTraits);
    if (alignment.contains("Lawful")) {
      pool += godLawfulTraits;
    } else if (alignment.contains("Chaotic")) {
      pool += godChaoticTraits;
    }
    return random.chooseFrom(pool);
  }

  static VillainRace? _generateRace(String alignment, Random random) {
    if (random.nextInt(10) == 0) {
      return null;
    }
    VillainRace race = random.chooseFrom(VillainRace.values);
    if (!alignment.contains("Evil") && !race.isNormalRace) {
      race = random.chooseFrom(VillainRace.values);
    }
    return race;
  }

  static String _generateDepiction(VillainRace? race, Random random) {
    if (random.nextBool()) {
      String d1 = random.chooseFrom(godDepiction4);
      String d2 = random.chooseFrom(godDepiction4);
      while (d2 == d1) {
        d2 = random.chooseFrom(godDepiction4);
      }
      return "a $d1 and $d2 ${race?.printedName ?? "figure"}";
    } else if (random.nextBool()) {
      return "a ${random.chooseFrom(godDepiction1)} ${random.chooseFrom(godDepiction3).split(" ")[1]}";
    } else {
      return "a ${random.chooseFrom(godDepiction2).replaceAll("RACE", (race ?? random.chooseFrom(VillainRace.values))!.printedName)} ${random.chooseFrom(godDepiction3)}";
    }
  }
}
