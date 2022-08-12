import 'dart:math';

import 'package:rpgsolo/classes/npcs/background.dart';
import 'package:rpgsolo/classes/npcs/personality.dart';
import 'package:rpgsolo/classes/npcs/physical.dart';
import 'package:rpgsolo/classes/villains/villain.dart';
import 'package:rpgsolo/classes/villains/villain_action.dart';
import 'package:rpgsolo/classes/villains/villain_motives.dart';
import 'package:rpgsolo/data/npcs/npc_data.dart';
import 'package:rpgsolo/data/races.dart';
import 'package:rpgsolo/data/villains/villain_data.dart';
import 'package:rpgsolo/generator/npcs/background_generator.dart';
import 'package:rpgsolo/generator/npcs/name_generator.dart';
import 'package:rpgsolo/generator/villains/villain_action_generator.dart';
import 'package:rpgsolo/generator/villains/villain_motives_generaotr.dart';
import 'package:rpgsolo/generator/villains/villain_personality_generator.dart';
import 'package:rpgsolo/generator/villains/villain_physical_generator.dart';
import 'package:rpgsolo/utils/extensions.dart';

class VillainGenerator {
  static Villain generate([VillainPower? villainPower, Random? random]) {
    Random rand = random ?? Random();
    VillainPower power = villainPower ?? rand.chooseFrom(VillainPower.values);
    VillainRace race = rand.chooseFrom(VillainRace.values);
    int age = _generateAge(race, rand);
    bool isMale = rand.nextBool();
    String occupation = rand.chooseFrom(villainClasses);
    String orientation = _generateOrientation(race, rand);
    String relationshipStatus = rand.chooseFrom(relationshipStatuses);
    String name = VillainRaceNameGenerator.generate(isMale, race, rand);
    Physical physical = VillainPhysicalGenerator.generate(race, isMale, rand);
    Personality personality = VillainPersonalityGenerator.generate(race, rand);
    VillainMotives motives = VillainMotivesGenerator.generate(isMale, rand);
    List<VillainAction> actions = List.generate(villainActions[power] ?? 0,
        (index) => VillainActionGenerator.generate(name, isMale, rand));
    Background background = BackgroundGenerator.generate(
        race, isMale, name, personality.alignment, rand);
    Villain villain = Villain(
        name: name,
        age: age,
        isMale: isMale,
        power: power,
        race: race,
        occupation: occupation,
        orientation: orientation,
        relationshipStatus: relationshipStatus,
        physical: physical,
        personality: personality,
        motives: motives,
        actions: actions,
        background: background);
    return villain;
  }

  static int _generateAge(VillainRace race, Random random) {
    int min = race == VillainRace.elf || race == VillainRace.drow
        ? 74
        : race == VillainRace.giant
            ? 300
            : 14;
    late int max;
    if (race.isNormalRace) {
      max = maxAge[race.asRace] ?? 90;
    } else {
      max = villainMaxAge[race] ?? 90;
    }
    return random.nextInt(max + 1 - min) + min;
  }

  static String _generateOrientation(VillainRace race, Random random) {
    int val = random.nextInt(88);
    if (val < 3) {
      return "bisexual";
    } else if (val < 8) {
      return "gay";
    }
    return "straight";
  }
}
