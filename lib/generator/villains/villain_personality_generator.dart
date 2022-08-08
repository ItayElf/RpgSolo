import 'dart:math';

import 'package:rpgsolo/classes/npcs/personality.dart';
import 'package:rpgsolo/data/npcs/personality_data.dart';
import 'package:rpgsolo/data/races.dart';
import 'package:rpgsolo/data/villains/villain_personality_data.dart';
import 'package:rpgsolo/generator/npcs/personality_generator.dart';
import 'package:rpgsolo/utils/extensions.dart';

class VillainPersonalityGenerator {
  static Personality generate(VillainRace race, [Random? random]) {
    late Personality personality;
    Random rand = random ?? Random();
    if (race.isNormalRace) {
      personality = PersonalityGenerator.generate(race.asRace);
      personality = personality.copyWith(
          alignment: personality.alignment
              .replaceAll("Good", rand.nextBool() ? "Natural" : "Evil"));
    } else {
      String alignment = _generateAlignment(race, rand);
      String trait1 = _generateTrait(race, rand);
      String trait2 = _generateTrait(race, rand);
      while (trait2 == trait1) {
        trait2 = _generateTrait(race, rand);
      }
      String quirk1 = _generateQuirk(race, rand);
      String quirk2 = _generateQuirk(race, rand);
      while (quirk2 == quirk1) {
        quirk2 = _generateQuirk(race, rand);
      }
      personality = Personality(
          alignment: alignment,
          trait1: trait1,
          trait2: trait2,
          quirk1: quirk1,
          quirk2: quirk2);
    }
    return personality;
  }

  static String _generateAlignment(VillainRace race, Random random) {
    List<int> ethicalModifiers = villainEthicalAlignment[race] ?? [0, 0, 0];
    List<int> moralModifiers = villainMoralAlignment[race] ?? [0, 0, 0];
    List<int> ethicalValues = List.generate(3, (index) => random.nextInt(7));
    List<int> moralValues = List.generate(3, (index) => random.nextInt(7));
    for (int i = 0; i < ethicalValues.length; i++) {
      ethicalValues[i] += ethicalModifiers[i];
      moralValues[i] += moralModifiers[i];
    }
    int maxEthical = ethicalValues.reduce(max);
    int maxMoral = moralValues.reduce(max);
    String res = "";
    if (maxEthical == ethicalValues[0]) {
      res = "Lawful";
    } else if (maxEthical == ethicalValues[1]) {
      res = "True";
    } else {
      res = "Chaotic";
    }
    if (maxMoral == moralValues[0]) {
      res += " Good";
    } else if (maxMoral == moralValues[1]) {
      res += " Natural";
    } else {
      res += " Evil";
    }
    return res;
  }

  static String _generateTrait(VillainRace race, Random random) {
    return traits[random.nextInt(traits.length)];
  }

  static String _generateQuirk(VillainRace race, Random random) {
    List<String> pool = quirks;
    if (race == VillainRace.duergar) {
      pool += duergarQuirks;
    } else if (race == VillainRace.drow || race == VillainRace.halfDrow) {
      pool += drowQuirks;
    }
    return pool[random.nextInt(pool.length)];
  }
}
