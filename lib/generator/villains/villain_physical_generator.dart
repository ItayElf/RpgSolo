import 'dart:math';

import 'package:rpgsolo/classes/npcs/physical.dart';
import 'package:rpgsolo/data/npcs/physical_data.dart';
import 'package:rpgsolo/data/races.dart';
import 'package:rpgsolo/data/villains/villain_physical_data.dart';
import 'package:rpgsolo/generator/npcs/physical_generator.dart';
import 'package:rpgsolo/utils/extensions.dart';

class VillainPhysicalGenerator {
  static Physical generate(VillainRace race, bool isMale, [Random? random]) {
    Random rand = random ?? Random();
    if (race.isNormalRace) {
      return PhysicalGenerator.generate(race.asRace, isMale);
    }
    String hair = _generateHair(race, isMale, rand);
    String eyes = "${rand.chooseFrom(eyeColor)} eyes";
    String skin = _generateSkin(race, rand);
    int height = _generateHeight(race, rand);
    String body = _generateBody(race, rand);
    String face = _generateFace(race, isMale, rand);
    List<String> res = _generateSpecial(race, rand);
    String special = res[0];
    String? special2 = res.length == 2 ? res[1] : null;
    Physical physical = Physical(
        hair: hair,
        eyes: eyes,
        skin: skin,
        height: height,
        build: body,
        face: face,
        special: special,
        special2: special2);
    return physical;
  }

  static String _generateHair(VillainRace race, bool isMale, Random random) {
    if (race == VillainRace.yuanTi) {
      return "${random.chooseFrom(dragonHair)} head";
    }
    if (race != VillainRace.drow &&
        isMale &&
        random.nextInt(50) < (race == VillainRace.duergar ? 35 : 8)) {
      return "bald head";
    }
    String length = random.chooseFrom(hairLength);
    String type = random.chooseFrom(hairType);
    String color =
        race == VillainRace.duergar ? "gray" : random.chooseFrom(hairColor);
    return "$length, $type, $color hair";
  }

  static String _generateSkin(VillainRace race, Random random) {
    late List<String> pool;
    if (race == VillainRace.yuanTi) {
      return "${random.chooseFrom(scaleTexture)} ${random.chooseFrom(scaleColor)} scales";
    } else if (race == VillainRace.orc) {
      pool = orcSkin;
    } else if (race == VillainRace.drow) {
      pool = drowSkin;
    } else if (race == VillainRace.halfDrow) {
      pool = drowSkin + humanSkin;
    } else if (race == VillainRace.duergar) {
      pool = duergarSkin;
    } else if (race == VillainRace.giant) {
      pool = giantSkin;
    } else {
      pool = humanSkin;
    }
    return "${random.chooseFrom(pool)} skin";
  }

  static int _generateHeight(VillainRace race, Random random) {
    int height = random.nextInt(198 - 142) + 142;
    int mod = villainHeightModifier[race] ?? 0;
    return height + mod;
  }

  static String _generateBody(VillainRace race, Random random) {
    late List<String> pool;
    if ([VillainRace.duergar, VillainRace.giant, VillainRace.orc]
        .contains(race)) {
      pool = strongWeight;
    } else if (race == VillainRace.drow) {
      pool = lightWeight;
    } else {
      pool = regularWeight;
    }
    return "${random.chooseFrom(pool)} build";
  }

  static String _generateFace(VillainRace race, bool isMale, Random random) {
    List<String> pool = goolLooking;
    if (race != VillainRace.drow) {
      pool += regularLooking;
    }
    String face = "${random.chooseFrom(pool)} face";
    String beard = _generateBeard(race, isMale, random);
    if (beard != "") {
      face = [face, beard].join(" with a ");
    }
    return face;
  }

  static String _generateBeard(VillainRace race, bool isMale, Random random) {
    if (!isMale || race == VillainRace.drow) {
      return "";
    }
    if (race != VillainRace.duergar && random.nextInt(5) < 3) {
      return "";
    }
    late List<String> pool;
    if (race == VillainRace.duergar) {
      pool = longBeard;
    } else {
      pool = beardLength;
    }
    return "${random.chooseFrom(pool)} ${random.chooseFrom(beardShape)}";
  }

  static List<String> _generateSpecial(VillainRace race, Random random) {
    List<String> res = [random.chooseFrom(specialPhysical)];
    if (random.nextInt(6) == 0) {
      String val = random.chooseFrom(specialPhysical);
      while (res.contains(val)) {
        val = random.chooseFrom(specialPhysical);
      }
      res.add(val);
    }
    return res;
  }
}
