import 'dart:math';

import 'package:rpgsolo/classes/npcs/background.dart';
import 'package:rpgsolo/classes/npcs/npc.dart';
import 'package:rpgsolo/classes/npcs/personality.dart';
import 'package:rpgsolo/classes/npcs/physical.dart';
import 'package:rpgsolo/data/npcs/npc_data.dart';
import 'package:rpgsolo/data/races.dart';
import 'package:rpgsolo/generator/npcs/background_generator.dart';
import 'package:rpgsolo/generator/npcs/name_generator.dart';
import 'package:rpgsolo/generator/npcs/personality_generator.dart';
import 'package:rpgsolo/generator/npcs/physical_generator.dart';
import 'package:rpgsolo/utils/extensions.dart';

class NpcGenerator {
  static Npc generate([Race? race, Random? random]) {
    Random rand = random ?? Random();
    Race r = race ?? rand.chooseFrom(Race.values);
    int age = _generateAge(r, rand);
    bool isMale = rand.nextBool();
    String occupation = rand.chooseFrom(occupations);
    String orientation = _generateOrientation(r, rand);
    String relationshipStatus = rand.chooseFrom(relationshipStatuses);
    String hook = rand.chooseFrom(hooks);
    String name = NameGenerator.generate(isMale, r, rand);
    Physical physical = PhysicalGenerator.generate(r, isMale, rand);
    Personality personality = PersonalityGenerator.generate(r, rand);
    Background background = BackgroundGenerator.generate(
        r.asVillainRace, isMale, name, personality.alignment, rand);
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
        personality: personality,
        background: background);
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
