import 'dart:math';

import 'package:rpgsolo/classes/npcs/physical.dart';
import 'package:rpgsolo/data/npcs/physical_data.dart';
import 'package:rpgsolo/data/races.dart';
import 'package:rpgsolo/utils/extensions.dart';

class PhysicalGenerator {
  static Physical generate(Race race, bool isMale, [Random? random]) {
    Random rand = random ?? Random();
    String hair = _generateHair(race, isMale, rand);
    String eyes = "${rand.chooseFrom(eyeColor)} eyes";
    String skin = _generateSkin(race, rand);
    int height = _generateHeight(race, rand);
    String body = _generateBody(race, rand);
    String face = _generateFace(race, rand, isMale);
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

  static String _generateHair(Race race, bool isMale, Random random) {
    if (race == Race.dragonborn) {
      return "${random.chooseFrom(dragonHair)} head";
    } else if (race == Race.goliath) {
      return random.chooseFrom(goliathHair);
    }
    if (race != Race.elf && isMale && random.nextInt(50) < 8) {
      return "bald head";
    }
    String length = random.chooseFrom(hairLength);
    String type = random.chooseFrom(hairType);
    String color = random.chooseFrom(hairColor);
    return "$length, $type, $color hair";
  }

  static String _generateSkin(Race race, Random random) {
    late List<String> pool;
    if (race == Race.dragonborn) {
      return "${random.chooseFrom(scaleTexture)} ${random.chooseFrom(scaleColor)} scales";
    }
    if (race == Race.halfElf) {
      pool = humanSkin + elfSkin;
    } else if (race == Race.halfOrc || race == Race.goblin) {
      pool = orcSkin;
    } else if (race == Race.elf) {
      pool = elfSkin;
    } else if (race == Race.tiefling) {
      pool = tieflingSkin;
    } else if (race == Race.goliath) {
      pool = ["gray"];
    } else if (race == Race.gnome) {
      pool = gnomeSkin;
    } else {
      pool = humanSkin;
    }
    return "${random.chooseFrom(pool)} skin";
  }

  static int _generateHeight(Race race, Random random) {
    int height = random.nextInt(198 - 142) + 142;
    int mod = heightModifier[race] ?? 0;
    return height + mod;
  }

  static String _generateBody(Race race, Random random) {
    late List<String> pool;
    if ([
      Race.dragonborn,
      Race.dwarf,
      Race.goliath,
      Race.halfOrc,
    ].contains(race)) {
      pool = strongWeight;
    } else if ([Race.elf, Race.tiefling].contains(race)) {
      pool = lightWeight;
    } else {
      pool = regularWeight;
    }
    return "${random.chooseFrom(pool)} build";
  }

  static String _generateFace(Race race, Random random, bool isMale) {
    List<String> pool = goolLooking;
    if (race != Race.elf) {
      pool += regularLooking;
    }
    String face = "${random.chooseFrom(pool)} face";
    String beard = _generateBeard(race, random, isMale);
    if (beard != "") {
      face = [face, beard].join(" with a ");
    }
    return face;
  }

  static String _generateBeard(Race race, Random random, bool isMale) {
    if (!isMale || [Race.elf, Race.dragonborn, Race.goblin].contains(race)) {
      return "";
    }
    if (race != Race.dwarf && random.nextInt(5) < 3) {
      return "";
    }
    late List<String> pool;
    if (race == Race.dwarf) {
      pool = longBeard;
    } else {
      pool = beardLength;
    }
    return "${random.chooseFrom(pool)} ${random.chooseFrom(beardShape)}";
  }

  static List<String> _generateSpecial(Race race, Random random) {
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
