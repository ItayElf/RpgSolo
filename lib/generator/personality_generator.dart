import 'dart:math';

import 'package:rpgsolo/classes/personality.dart';
import 'package:rpgsolo/data/personality_data.dart';
import 'package:rpgsolo/data/races.dart';

class PersonalityGenerator {
  static Personality generate(Race race, [Random? random]) {
    Random rand = random ?? Random();
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
    Personality personality = Personality(
        alignment: alignment,
        trait1: trait1,
        trait2: trait2,
        quirk1: quirk1,
        quirk2: quirk2);
    return personality;
  }

  static String _generateAlignment(Race race, Random random) {
    List<int> ethicalModifiers = ethicalAlignment[race] ?? [0, 0, 0];
    List<int> moralModifiers = moralAlignment[race] ?? [0, 0, 0];
    List<int> ethicalValues = List.generate(3, (index) => random.nextInt(7));
    List<int> moralValues = List.generate(3, (index) => random.nextInt(7));
    [0, 1, 2].map((i) {
      ethicalValues[i] += ethicalModifiers[i];
      moralValues[i] += moralModifiers[i];
    });
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

  static String _generateTrait(Race race, Random random) {
    return traits[random.nextInt(traits.length)];
  }

  static String _generateQuirk(Race race, Random random) {
    List<String> pool = quirks;
    if (race == Race.dragonborn) {
      pool += dragonbornQuirks;
    } else if (race == Race.dwarf) {
      pool += dwarfQuirks;
    } else if (race == Race.elf) {
      pool += elfQuirks;
    } else if (race == Race.gnome) {
      pool += gnomeQuirks;
    } else if (race == Race.goliath) {
      pool += goliathQuirks;
    } else if (race == Race.halfling) {
      pool += halflingQuirks;
    }
    return pool[random.nextInt(pool.length)];
  }
}
