import 'dart:math';

import 'package:rpgsolo/classes/encounter.dart';
import 'package:rpgsolo/classes/nature_location.dart';
import 'package:rpgsolo/data/encounter_data.dart';
import 'package:rpgsolo/data/nature_location_data.dart';
import 'package:rpgsolo/generator/encounter_generator.dart';
import 'package:rpgsolo/generator/npcs/name_generator.dart';
import 'package:rpgsolo/generator/town_generator.dart';

class NatureLocationGenerator {
  static NatureLocation generate(
      [NatureLocationType? locationType, Random? random]) {
    Random rand = random ?? Random();
    NatureLocationType type = locationType ??
        NatureLocationType
            .values[rand.nextInt(NatureLocationType.values.length)];
    String name = _generateName(type, rand);
    String direction =
        natureLocationDirection[rand.nextInt(natureLocationDirection.length)];
    String knownFor =
        natureLocationKnown[rand.nextInt(natureLocationKnown.length)];
    String weather = _generateWeather(type, rand);
    String madeFrom = _generateMadeFrom(type, rand);
    String size = _generateSize(type, rand);
    String creature = _generateCreature(type, rand);
    String travelRate = natureTravelRate[rand.nextInt(natureTravelRate.length)];
    String resource = _generateResource(type, rand);
    List<Encounter> encounters =
        List.generate(2, (index) => EncounterGenerator.generate(type, rand));
    encounters[0] =
        EncounterGenerator.generate(type, rand).copyWith(encounter: creature);
    while (encounters[0].description.isEmpty) {
      encounters[0] =
          EncounterGenerator.generate(type, rand).copyWith(encounter: creature);
    }
    NatureLocation location = NatureLocation(
        name: name,
        type: type,
        direction: direction,
        knownFor: knownFor,
        weather: weather,
        madeFrom: madeFrom,
        size: size,
        creature: creature,
        travelRate: travelRate,
        resource: resource,
        encounters: encounters);
    return location;
  }

  static String _generateName(NatureLocationType type, Random random) {
    String name =
        VillainRaceNameGenerator.generate(random.nextBool(), null, random)
            .split(" ")[0];
    if (type == NatureLocationType.coast) {
      return name + (random.nextBool() ? " coast" : " shore");
    } else if (type == NatureLocationType.desert) {
      return "$name desert";
    } else if (type == NatureLocationType.forest) {
      return name + (random.nextBool() ? " forest" : " woods");
    } else if (type == NatureLocationType.mountain) {
      return "mt. $name";
    } else if (type == NatureLocationType.sea) {
      return random.nextBool()
          ? "sea of ${TownGenerator.generate(null, random).name}"
          : "$name sea";
    } else if (type == NatureLocationType.swamp) {
      return name + (random.nextBool() ? " swamp" : " bog");
    }
    throw Exception("Unknown type $type");
  }

  static String _generateWeather(NatureLocationType type, Random random) {
    List<String> pool = natureLocationWeather[type] ?? [];
    return pool[random.nextInt(pool.length)];
  }

  static String _generateMadeFrom(NatureLocationType type, Random random) {
    List<String> pool = natureLocationMadeFrom[type] ?? [];
    return pool[random.nextInt(pool.length)];
  }

  static String _generateSize(NatureLocationType type, Random random) {
    List<String> pool = natureLocationSize[type] ?? [];
    return pool[random.nextInt(pool.length)];
  }

  static String _generateCreature(NatureLocationType type, Random random) {
    List<String> pool = List.from(
        encounterObject[type]!["int"]! + encounterObject[type]!["mon"]!);
    String creature = pool[random.nextInt(pool.length)];
    while (creature.startsWith("a ") || creature.startsWith("an ")) {
      pool.remove(creature);
      creature = pool[random.nextInt(pool.length)];
    }
    return creature;
  }

  static String _generateResource(NatureLocationType type, Random random) {
    List<String> pool = natureResources[type] ?? [];
    return pool[random.nextInt(pool.length)];
  }
}
