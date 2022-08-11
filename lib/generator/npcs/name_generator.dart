import 'dart:math';

import 'package:rpgsolo/data/npcs/name_data.dart';
import 'package:rpgsolo/data/races.dart';
import 'package:rpgsolo/data/villains/villain_names.dart';
import 'package:rpgsolo/utils/extensions.dart';

class NameGenerator {
  static String generate(bool isMale, [Race? race, Random? random]) {
    Random rand = random ?? Random();
    Race r = race ?? rand.chooseFrom(Race.values);
    Map<Race, String Function(bool, Random)> map = {
      Race.dragonborn: _generateDragonbornName,
      Race.dwarf: _generateDwarfName,
      Race.elf: _generateElfName,
      Race.gnome: _generateGnomeName,
      Race.goblin: _generateGoblinName,
      Race.goliath: _generateGoliathName,
      Race.halfElf: _generateHalfElfName,
      Race.halfOrc: _generateHalfOrcName,
      Race.halfling: _generateHalflingName,
      Race.human: _generateHumanName,
      Race.tiefling: _generateTieflingName,
    };
    String name = (map[r] ?? () => "")(isMale, rand).toLowerCase();
    int count = 0;
    while ((name.split(" ")[0].length > 7 || name.split(" ")[1].length > 7) &&
        count++ < 5) {
      name = (map[r] ?? () => "")(isMale, rand).toLowerCase();
    }
    return name;
  }

  static String _generateDragonbornName(bool isMale, Random random) {
    late String name;
    if (isMale) {
      name = dragonbornName1[random.nextInt(dragonbornName1.length)] +
          dragonbornName2[random.nextInt(dragonbornName2.length)];
    } else {
      name = dragonbornName3[random.nextInt(dragonbornName3.length)] +
          dragonbornName4[random.nextInt(dragonbornName4.length)];
    }
    int rand = random.nextInt(dragonbornName5.length);
    int rand2 = random.nextInt(dragonbornName6.length);
    int rand3 = random.nextInt(dragonbornName7.length);
    int rand4 = random.nextInt(dragonbornName6.length);
    int rand5 = random.nextInt(dragonbornName8.length);
    while (dragonbornName7[rand3] == dragonbornName5[rand] ||
        dragonbornName7[rand3] == dragonbornName8[rand5]) {
      rand3 = random.nextInt(dragonbornName7.length);
    }
    String surname = dragonbornName5[rand] +
        dragonbornName6[rand2] +
        dragonbornName7[rand3] +
        dragonbornName6[rand4] +
        dragonbornName8[rand5];
    return "$name $surname";
  }

  static String _generateDwarfName(bool isMale, Random random) {
    late int rand, rand2, rand3;
    late String name;
    String surname =
        "${dwarfName7[random.nextInt(dwarfName7.length)]}${dwarfName8[random.nextInt(dwarfName8.length)]}";
    if (isMale) {
      rand = random.nextInt(dwarfName1.length);
      rand2 = random.nextInt(dwarfName2.length);
      rand3 = random.nextInt(dwarfName3.length);
      name = [dwarfName1[rand], dwarfName2[rand2], dwarfName3[rand3]].join("");
    } else {
      rand = random.nextInt(dwarfName4.length);
      rand2 = random.nextInt(dwarfName5.length);
      rand3 = random.nextInt(dwarfName6.length);
      name = [dwarfName4[rand], dwarfName5[rand2], dwarfName6[rand3]].join("");
    }
    return "$name $surname";
  }

  static String _generateElfName(bool isMale, Random random) {
    String surname =
        "${elfName3[random.nextInt(elfName3.length)]}${elfName4[random.nextInt(elfName4.length)]}";
    String name = isMale
        ? elfName1[random.nextInt(elfName1.length)]
        : elfName2[random.nextInt(elfName2.length)];
    return "$name $surname";
  }

  static String _generateGnomeName(bool isMale, Random random) {
    int rand = random.nextInt(gnomeName1.length);
    int rand2 = random.nextInt(gnomeName2.length);
    int rand3 = random.nextInt(gnomeName3.length);
    int rand4 = random.nextInt(gnomeName2.length);
    int rand5 = random.nextInt(gnomeName4.length);
    String nameM = [
      gnomeName1[rand],
      gnomeName2[rand2],
      gnomeName3[rand3],
      gnomeName2[rand4],
      gnomeName4[rand5]
    ].join("");
    rand = random.nextInt(gnomeName5.length);
    rand2 = random.nextInt(gnomeName2.length);
    rand3 = random.nextInt(gnomeName6.length);
    rand4 = random.nextInt(gnomeName2.length);
    rand5 = random.nextInt(gnomeName7.length);
    String nameF = [
      gnomeName5[rand],
      gnomeName2[rand2],
      gnomeName6[rand3],
      gnomeName2[rand4],
      gnomeName7[rand5]
    ].join("");
    return isMale ? "$nameM $nameF" : "$nameF $nameM";
  }

  static String _generateGoblinName(bool isMale, Random random) {
    int rand = random.nextInt(goblinName1.length);
    int rand2 = random.nextInt(goblinName2.length);
    int rand3 = random.nextInt(goblinName3.length);
    String nameM =
        [goblinName1[rand], goblinName2[rand2], goblinName3[rand3]].join("");
    rand = random.nextInt(goblinName4.length);
    rand2 = random.nextInt(goblinName2.length);
    rand3 = random.nextInt(goblinName5.length);
    int rand4 = random.nextInt(goblinName6.length);
    String nameF = [
      goblinName4[rand],
      goblinName2[rand2],
      goblinName5[rand3],
      goblinName6[rand4]
    ].join("");
    return isMale ? "$nameM $nameF" : "$nameF $nameM";
  }

  static String _generateGoliathName(bool isMale, Random random) {
    int rand = random.nextInt(goliathName1.length);
    int rand2 = random.nextInt(goliathName2.length);
    int rand3 = random.nextInt(goliathName3.length);
    int rand4 = random.nextInt(goliathName4.length);
    String name = [
      goliathName1[rand],
      goliathName2[rand2],
      goliathName3[rand3],
      goliathName4[rand4]
    ].join("");
    if (random.nextBool()) {
      rand = random.nextInt(goliathName5.length);
      rand2 = random.nextInt(goliathName6.length);
      name = "$name ${goliathName5[rand]}${goliathName6[rand2]}";
    } else {
      rand = random.nextInt(goliathName7.length);
      rand2 = random.nextInt(goliathName8.length);
      name = "$name ${goliathName7[rand]}${goliathName8[rand2]}";
    }
    return name;
  }

  static String _generateHalfElfName(bool isMale, Random random) {
    if (random.nextBool()) {
      return _generateElfName(isMale, random);
    } else {
      return _generateHumanName(isMale, random);
    }
  }

  static String _generateHalfOrcName(bool isMale, Random random) {
    int rand = random.nextInt(halfOrcName1.length);
    int rand2 = random.nextInt(halfOrcName2.length);
    int rand3 = random.nextInt(halfOrcName3.length);
    String nameM =
        [halfOrcName1[rand], halfOrcName2[rand2], halfOrcName3[rand3]].join("");
    rand = random.nextInt(halfOrcName4.length);
    rand2 = random.nextInt(halfOrcName2.length);
    rand3 = random.nextInt(halfOrcName5.length);
    int rand4 = random.nextInt(halfOrcName6.length);
    String nameF = [
      halfOrcName4[rand],
      halfOrcName2[rand2],
      halfOrcName5[rand3],
      halfOrcName6[rand4]
    ].join("");
    return isMale ? "$nameM $nameF" : "$nameF $nameM";
  }

  static String _generateHalflingName(bool isMale, Random random) {
    String surname =
        "${halflingName12[random.nextInt(halflingName12.length)]}${halflingName13[random.nextInt(halflingName13.length)]}";
    late String name;
    late int rand, rand2;
    if (isMale) {
      rand = random.nextInt(halflingName1.length);
      rand2 = random.nextInt(halflingName2.length);
      name = "${halflingName1[rand]}${halflingName2[rand2]}";
    } else {
      rand = random.nextInt(halflingName3.length);
      rand2 = random.nextInt(halflingName4.length);
      name = "${halflingName3[rand]}${halflingName4[rand2]}";
    }
    return "$name $surname";
  }

  static String _generateHumanName(bool isMale, Random random) {
    int rand = random.nextInt(humanName1.length);
    int rand2 = random.nextInt(humanName2.length);
    String surname = "${humanName1[rand]}${humanName2[rand2]}";
    late int rand3, rand4, rand5;
    late String name;
    if (isMale) {
      rand = random.nextInt(humanName8.length);
      rand2 = random.nextInt(humanName9.length);
      rand3 = random.nextInt(humanName10.length);
      rand4 = random.nextInt(humanName9.length);
      rand5 = random.nextInt(humanName11.length);
      name = [
        humanName8[rand],
        humanName9[rand2],
        humanName10[rand3],
        humanName9[rand4],
        humanName11[rand5]
      ].join("");
    } else {
      rand = random.nextInt(humanName5.length);
      rand2 = random.nextInt(humanName4.length);
      rand3 = random.nextInt(humanName6.length);
      rand4 = random.nextInt(humanName4.length);
      rand5 = random.nextInt(humanName7.length);
      name = [
        humanName5[rand],
        humanName4[rand2],
        humanName6[rand3],
        humanName4[rand4],
        humanName7[rand5]
      ].join("");
    }
    return "$name $surname";
  }

  static String _generateTieflingName(bool isMale, Random random) {
    int rand = random.nextInt(tieflingName1.length);
    int rand2 = random.nextInt(tieflingName2.length);
    String nameM = [
      tieflingName1[rand],
      tieflingName2[rand2],
    ].join("");
    rand = random.nextInt(tieflingName3.length);
    rand2 = random.nextInt(tieflingName4.length);
    String nameF = [
      tieflingName3[rand],
      tieflingName4[rand2],
    ].join("");
    return isMale ? "$nameM $nameF" : "$nameF $nameM";
  }
}

class VillainRaceNameGenerator {
  static String generate(bool isMale, [VillainRace? race, Random? random]) {
    Random rand = random ?? Random();
    VillainRace r = race ?? rand.chooseFrom(VillainRace.values);
    if (r.isNormalRace) {
      return NameGenerator.generate(
        isMale,
        Race.values.firstWhere((e) => e.toString() == "Race.${r.name}"),
        random,
      );
    } else if (r == VillainRace.orc) {
      return NameGenerator.generate(isMale, Race.halfOrc, random);
    } else if (r == VillainRace.duergar) {
      return NameGenerator.generate(isMale, Race.dwarf, random);
    } else if (r == VillainRace.drow) {
      return _generateDrowName(isMale, rand);
    } else if (r == VillainRace.halfDrow) {
      return rand.nextBool()
          ? _generateDrowName(isMale, rand)
          : NameGenerator.generate(isMale, Race.human, rand);
    } else if (r == VillainRace.giant) {
      return _generateGiantName(isMale, rand);
    } else if (r == VillainRace.yuanTi) {
      return _generateYuanTiName(isMale, rand);
    }
    throw Exception("Inavlid race: ${r.name}");
  }

  static String _generateDrowName(bool isMale, Random random) {
    String sur =
        "${drowNames1[random.nextInt(drowNames1.length)]}${drowNames2[random.nextInt(drowNames2.length)]}";
    late String name;
    if (isMale) {
      name =
          "${drowNames5[random.nextInt(drowNames5.length)]}${drowNames6[random.nextInt(drowNames6.length)]}";
    } else {
      name =
          "${drowNames3[random.nextInt(drowNames3.length)]}${drowNames4[random.nextInt(drowNames4.length)]}";
    }
    return "$name $sur".toLowerCase();
  }

  static String _generateGiantName(bool isMale, Random random) {
    String name =
        "${giantNames1[random.nextInt(giantNames1.length)]}${giantNames2[random.nextInt(giantNames2.length)]}${giantNames3[random.nextInt(giantNames3.length)]}${giantNames4[random.nextInt(giantNames4.length)]}";
    String sur =
        "${giantNames1[random.nextInt(giantNames1.length)]}${giantNames2[random.nextInt(giantNames2.length)]}${giantNames3[random.nextInt(giantNames3.length)]}${giantNames4[random.nextInt(giantNames4.length)]}";
    while (sur == name) {
      sur =
          "${giantNames1[random.nextInt(giantNames1.length)]}${giantNames2[random.nextInt(giantNames2.length)]}${giantNames3[random.nextInt(giantNames3.length)]}${giantNames4[random.nextInt(giantNames4.length)]}";
    }
    return "$name $sur".toLowerCase();
  }

  static String _generateYuanTiName(bool isMale, Random random) {
    getName() {
      int rand = random.nextInt(yuanTiNames1.length),
          rand2 = random.nextInt(yuanTiNames2.length),
          rand3 = random.nextInt(yuanTiNames3.length),
          rand4 = random.nextInt(yuanTiNames5.length),
          rand5 = random.nextInt(yuanTiNames6.length);
      while (yuanTiNames1[rand] == yuanTiNames3[rand3] ||
          yuanTiNames3[rand3] == yuanTiNames6[rand5]) {
        rand3 = random.nextInt(yuanTiNames3.length);
      }
      return "${yuanTiNames1[rand]}${yuanTiNames2[rand2]}${yuanTiNames3[rand3]}${yuanTiNames5[rand4]}${yuanTiNames6[rand5]}";
    }

    String n1 = getName();
    String n2 = getName();
    while (n2 == n1) {
      n2 = getName();
    }
    return "$n1 $n2".toLowerCase();
  }
}
