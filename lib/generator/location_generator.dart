import 'dart:math';

import 'package:rpgsolo/classes/npcs/npc.dart';
import 'package:rpgsolo/classes/towns/goods.dart';
import 'package:rpgsolo/classes/towns/location.dart';
import 'package:rpgsolo/data/races.dart';
import 'package:rpgsolo/data/towns/locations_data.dart';
import 'package:rpgsolo/generator/goods_generator.dart';
import 'package:rpgsolo/generator/npcs/npc_generator.dart';
import 'package:rpgsolo/utils/extensions.dart';

class LocationGenerator {
  static Location generate(
      [LocationType? locationType, Race? mainRace, Random? random]) {
    Random rand = random ?? Random();
    LocationType type = locationType ?? rand.chooseFrom(LocationType.values);
    Race race = mainRace ?? rand.chooseFrom(Race.values);

    Npc owner = _generateLocationOwner(type, race, rand);
    String name =
        _generateLocationName(type, owner.firstName, rand).toLowerCase();
    String location = _generateLocationLocation(type, rand);
    String description = _generateDescription(type, name, owner, rand);
    List<Goods> goods = GoodsGenerator.generate(type, rand);
    Location l = Location(
        name: name,
        owner: owner,
        location: location,
        description: description,
        type: type,
        goods: goods);
    l = _fixLocation(l);
    return l;
  }

  static Location _fixLocation(Location location) {
    Location l = location;
    if (location.type == LocationType.monument) {
      final RegExp reg = RegExp("this (.*?) is here to");
      String chunk = reg.firstMatch(location.description)?.group(0) ?? "";
      for (String type in monumentDesc2) {
        if (chunk.contains(type)) {
          l = l.copyWith(name: type.toTitleCase());
          break;
        }
      }
      for (String loc in monumentDesc3) {
        if (chunk.contains(loc)) {
          l = l.copyWith(location: loc);
          break;
        }
      }
    }
    return l;
  }

  static Npc _generateLocationOwner(
      LocationType type, Race mainRace, Random random) {
    Race race =
        random.nextInt(100) < 65 ? mainRace : random.chooseFrom(Race.values);
    Npc npc = NpcGenerator.generate(race, random)
        .copyWith(occupation: ownerOccupation[type]);
    return npc;
  }

  static String _generateLocationName(
      LocationType type, String ownerName, Random random) {
    if (type == LocationType.smithy) {
      return random.chooseFrom(smithyNames);
    } else if (type == LocationType.library) {
      return "${random.chooseFrom(libraryNames)} Library";
    } else if (type == LocationType.tower) {
      return "the ${random.chooseFrom(towerNames)}${random.nextBool() ? " Tower" : " Spire"}";
    } else if (type == LocationType.tavern) {
      return "${tavernNames1[random.nextInt(tavernNames1.length)]} ${tavernNames2[random.nextInt(tavernNames2.length)]}";
    } else if (type == LocationType.temple) {
      return "the ${templeNames1[random.nextInt(templeNames1.length)]} ${templeNames2[random.nextInt(templeNames2.length)]}";
    } else if (type == LocationType.guildhall) {
      return "${guildNames1[random.nextInt(guildNames1.length)]} ${guildNames2[random.nextInt(guildNames2.length)]}'s Guildhall";
    } else if (type == LocationType.generalStore) {
      return "the ${storeNames1[random.nextInt(storeNames1.length)]} ${storeNames2[random.nextInt(storeNames2.length)]}";
    } else if (type == LocationType.armory) {
      return "$ownerName's ${storeNames1[random.nextInt(storeNames1.length)]} Armory";
    } else if (type == LocationType.weaponry) {
      return "$ownerName's ${storeNames1[random.nextInt(storeNames1.length)]} Weaponry";
    } else if (type == LocationType.monument) {
      return "";
    }
    return "";
  }

  static String _generateLocationLocation(LocationType type, Random random) {
    String located = random.chooseFrom(locationZone);
    if (type == LocationType.monument) {
      return "in the $located";
    }
    String street = random.chooseFrom(streetOutside);
    String res = "in the $located. The street outside $street";
    if (random.nextBool()) {
      String val = random.chooseFrom(streetOutside);
      while (val == street) {
        val = random.chooseFrom(streetOutside);
      }
      res = "$res and $val";
    }
    return res;
  }

  static String _generateDescription(
      LocationType type, String name, Npc owner, Random random) {
    if (type == LocationType.monument) {
      return _generateMonumentDescription(type, owner, random);
    } else if (type == LocationType.tower) {
      return _generateTowerDescription(type, name, owner, random);
    } else {
      return _generateBuildingDescription(type, name, random);
    }
  }

  static String _generateMonumentDescription(
      LocationType type, Npc owner, Random random) {
    String purpose =
        "Built ${monumentDesc1[random.nextInt(monumentDesc1.length)]} ago, this ${monumentDesc2[random.nextInt(monumentDesc2.length)]} ${monumentDesc3[random.nextInt(monumentDesc3.length)]} is here to ${monumentDesc4[random.nextInt(monumentDesc4.length)]}. It was made to represent the ${monumentDesc5[random.nextInt(monumentDesc5.length)]}";
    String design =
        "It was designed by ${monumentDesc6[random.nextInt(monumentDesc6.length)]} named ${owner.name.toTitleCase()} who ${monumentDesc7[random.nextInt(monumentDesc7.length)]} captured the ${monumentDesc8[random.nextInt(monumentDesc8.length)]} of the region and used ${monumentDesc9[random.nextInt(monumentDesc9.length)]} style to convey ${owner.relPronoun} vision in this piece of art.";
    String materials =
        "Every element was crafted and created with ${monumentDesc10[random.nextInt(monumentDesc10.length)]} materials from local suppliers, ensuring this monument will ${monumentDesc11[random.nextInt(monumentDesc11.length)]}.";
    return "$purpose $design $materials";
  }

  static String _generateTowerDescription(
      LocationType type, String name, Npc owner, Random random) {
    int floors = random.nextInt(6 - 2) + 2;
    String outside =
        "${name.toTitleCase()} is a ${towerSize[floors - 2]} tower made out of ${random.chooseFrom(towerStone)} and is ${random.chooseFrom(towerAesthetic)}.";
    String built =
        "The tower was built ${monumentDesc1[random.nextInt(monumentDesc1.length)]} ago and is currently home to ${owner.name.toTitleCase()}, a wizard who is concerned with ${random.chooseFrom(towerConcern)}.";
    String levels = "The tower contains $floors levels,";
    if (floors == 2) {
      levels += " the wizard's private chambers and a library.";
    } else if (floors == 3) {
      levels +=
          " the wizard's private chambers, a library and ${random.chooseFrom(towerLevels)}.";
    } else if (floors == 4) {
      String level1 = random.chooseFrom(towerLevels);
      String level2 = random.chooseFrom(towerLevels);
      while (level2 == level1) {
        level2 = random.chooseFrom(towerLevels);
      }
      levels +=
          " the wizard's private chambers, a library, $level1 and $level2.";
    } else if (floors == 5) {
      List<String> pool = List.from(towerLevels);
      String level1 = random.chooseFrom(pool);
      pool.remove(level1);
      String level2 = random.chooseFrom(pool);
      pool.remove(level2);
      String level3 = random.chooseFrom(pool);
      levels +=
          " the wizard's private chambers, a library, $level1, $level2 and $level3.";
    }
    levels +=
        " The tower is protected by ${random.chooseFrom(towerProtection)}";
    return "$outside $built $levels.";
  }

  static String _generateBuildingDescription(
      LocationType type, String name, Random random) {
    String outside =
        "looks ${buildingOustide1[random.nextInt(buildingOustide1.length)]} from outside. It has been built with ${buildingOustide2[random.nextInt(buildingOustide2.length)]} and has ${buildingOustide3[random.nextInt(buildingOustide3.length)]} decorations. ${buildingOustide4[random.nextInt(buildingOustide4.length)]} windows ${buildingOustide5[random.nextInt(buildingOustide5.length)]} and have been added to the house ${buildingOustide6[random.nextInt(buildingOustide6.length)]}.";
    String shape =
        "This ${type.name} is ${buildingShape1[random.nextInt(buildingShape1.length)]}. ${buildingShape2[random.nextInt(buildingShape2.length)]}.";
    late String secondFloor;
    if ([LocationType.smithy, LocationType.temple].contains(type) ||
        random.nextBool()) {
      secondFloor = "There is only one floor in this building.";
    } else {
      int rand = random.nextInt(buildingSecondFloor1.length);
      late String filler;
      if (rand == 0) {
        filler =
            buildingSecondFloor2[random.nextInt(buildingSecondFloor2.length)];
      } else if (rand == 1) {
        filler = random.chooseFrom(buildingSecondFloor2b);
      } else {
        filler = random.chooseFrom(buildingSecondFloor2c);
      }
      secondFloor =
          "The second floor is ${buildingSecondFloor1[rand]}, $filler. This floor ${buildingSecondFloor3[random.nextInt(buildingSecondFloor3.length)]} the floor below.";
    }
    String roof =
        "The roof is ${buildinRoof1[random.nextInt(buildinRoof1.length)]} and is covered with ${buildinRoof2[random.nextInt(buildinRoof2.length)]}. ${buildinRoof3[random.nextInt(buildinRoof3.length)]}. ${buildinRoof4[random.nextInt(buildinRoof4.length)]}.";
    return "$outside $shape $secondFloor $roof";
  }
}
