import 'dart:math';

import 'package:rpgsolo/classes/npc.dart';
import 'package:rpgsolo/classes/personality.dart';
import 'package:rpgsolo/classes/physical.dart';
import 'package:rpgsolo/data/npc_data.dart';
import 'package:rpgsolo/data/races.dart';
import 'package:rpgsolo/generator/name_generator.dart';
import 'package:rpgsolo/generator/personality_generator.dart';
import 'package:rpgsolo/generator/physical_generator.dart';

class NpcGenerator {
  static Npc generate([Race? race, Random? random]) {
    Random rand = random ?? Random();
    Race r = race ?? Race.values[rand.nextInt(Race.values.length)];
    int age = _generateAge(r, rand);
    bool isMale = rand.nextBool();
    String occupation = occupations[rand.nextInt(occupations.length)];
    String orientation = _generateOrientation(r, rand);
    String relationshipStatus =
        relationshipStatuses[rand.nextInt(relationshipStatuses.length)];
    String hook = hooks[rand.nextInt(hooks.length)];
    String name = NameGenerator.generate(isMale, r, random);
    Physical physical = PhysicalGenerator.generate(r, isMale, random);
    Personality personality = PersonalityGenerator.generate(r, random);
    Npc npc = Npc(
        name: name,
        age: age,
        isMale: isMale,
        race: r,
        occupation: occupation,
        orientation: orientation,
        relationshipStatus: relationshipStatus,
        hook: hook,
        physical: physical,
        personality: personality);
    return npc;
  }

  static int _generateAge(Race race, Random random) {
    int min = race == Race.elf ? 74 : 14;
    int max = maxAge[race] ?? 90;
    return random.nextInt(max + 1 - min) + min;
  }

  static String _generateOrientation(Race race, Random random) {
    int val = random.nextInt(88);
    if (val < 3) {
      return "bisexual";
    } else if (val < 8) {
      return "gay";
    }
    return "straight";
  }
}
