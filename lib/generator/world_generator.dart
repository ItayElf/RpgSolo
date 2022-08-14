import 'dart:math';

import 'package:rpgsolo/classes/god.dart';
import 'package:rpgsolo/classes/nature_location.dart';
import 'package:rpgsolo/classes/npcs/npc.dart';
import 'package:rpgsolo/classes/towns/town.dart';
import 'package:rpgsolo/classes/villains/villain.dart';
import 'package:rpgsolo/classes/world.dart';
import 'package:rpgsolo/data/encounter_data.dart';
import 'package:rpgsolo/data/nature_location_data.dart';
import 'package:rpgsolo/data/races.dart';
import 'package:rpgsolo/data/towns/town_data.dart';
import 'package:rpgsolo/data/villains/villain_data.dart';
import 'package:rpgsolo/data/world_data.dart';
import 'package:rpgsolo/generator/god_generator.dart';
import 'package:rpgsolo/generator/nature_location_generator.dart';
import 'package:rpgsolo/generator/npcs/name_generator.dart';
import 'package:rpgsolo/generator/npcs/npc_generator.dart';
import 'package:rpgsolo/generator/town_generator.dart';
import 'package:rpgsolo/generator/villains/villain_generator.dart';
import 'package:rpgsolo/utils/extensions.dart';

class WorldGenerator {
  static World generate([Random? random]) {
    Random rand = random ?? Random();
    String name = _generateWorldName(rand);
    List<Town> towns = _generateTowns(rand);
    List<NatureLocation> terrain = _generateTerrain(rand);
    Map<String, String> oppinions = _generateOppinions(rand);
    List<Npc> importantPeople = List.generate(
        rand.nextInt(3) + 3, (_) => NpcGenerator.generate(null, rand));
    List<Villain> villains = _generateVillains(rand);
    List<God> gods = _generateGods(rand);
    List<String> loreItems = _generateLore(rand);
    World world = World(
        name: name,
        towns: towns,
        terrain: terrain,
        oppinions: oppinions,
        importantPeople: importantPeople,
        villains: villains,
        gods: gods,
        loreItems: loreItems);
    return world;
  }

  static String _generateWorldName(Random random) {
    Race mainRace = random.chooseFrom(Race.values);
    if (mainRace == Race.dwarf) {
      return "${townNamesDwarfs1[random.nextInt(townNamesDwarfs1.length)]}${townNamesDwarfs2[random.nextInt(townNamesDwarfs2.length)]}${townNamesDwarfs3[random.nextInt(townNamesDwarfs3.length)]}";
    } else if (mainRace == Race.elf) {
      return "${townNamesElves1[random.nextInt(townNamesElves1.length)]}${townNamesElves2[random.nextInt(townNamesElves2.length)]}${townNamesElves3[random.nextInt(townNamesElves3.length)]}";
    } else if (mainRace == Race.gnome) {
      return NameGenerator.generate(random.nextBool(), Race.gnome)
          .split(" ")[0];
    } else if (mainRace == Race.halfling) {
      List<String> name =
          NameGenerator.generate(random.nextBool(), Race.halfling).split(" ");
      name.removeAt(0);
      return name.join(" ");
    } else if (mainRace == Race.halfOrc) {
      return "${townNamesOrcs1[random.nextInt(townNamesOrcs1.length)]}${townNamesOrcs2[random.nextInt(townNamesOrcs2.length)]}${townNamesOrcs3[random.nextInt(townNamesOrcs3.length)]}${townNamesOrcs2[random.nextInt(townNamesOrcs2.length)]}${townNamesOrcs4[random.nextInt(townNamesOrcs4.length)]}";
    } else if (random.nextBool()) {
      return "${townNames1[random.nextInt(townNames1.length)]}${townNames2[random.nextInt(townNames2.length)]}${townNames3[random.nextInt(townNames3.length)]}";
    } else {
      return "${townNames3[random.nextInt(townNames3.length)]}${townNames4[random.nextInt(townNames4.length)]}";
    }
  }

  static List<Town> _generateTowns(Random random) {
    return [
      TownType.metropolis,
      TownType.city,
      TownType.city,
      TownType.city,
      TownType.town,
      TownType.town,
      TownType.town,
      TownType.village,
      TownType.village,
    ].map((e) => TownGenerator.generate(e, random)).toList();
  }

  static List<NatureLocation> _generateTerrain(Random random) {
    List<NatureLocation> terrain = [];
    int items = random.nextInt(3) + 5;
    late NatureLocation location;
    for (int _ in List.generate(items, (_) => _)) {
      location = NatureLocationGenerator.generate(null, random);
      while (terrain
              .map((e) => e.type)
              .where((element) => element == location.type)
              .length >=
          2) {
        location = NatureLocationGenerator.generate(null, random);
      }
      terrain.add(location);
    }
    return terrain;
  }

  static Map<String, String> _generateOppinions(Random random) {
    Map<String, String> res = {
      for (Race e in Race.values)
        e.pluralName:
            random.chooseFrom(generalOppinions + (oppinionObject[e] ?? []))
    };
    for (String k in res.keys) {
      while (
          res.keys.where((e) => e != k).map((e) => res[e]).contains(res[k])) {
        res[k] =
            random.chooseFrom(generalOppinions + (oppinionObject[e] ?? []));
      }
    }
    return res;
  }

  static List<Villain> _generateVillains(Random random) {
    return [
      VillainPower.archvillain,
      random.nextBool() ? VillainPower.national : VillainPower.regional,
      random.nextBool() ? VillainPower.national : VillainPower.regional,
      VillainPower.local,
      VillainPower.local,
    ].map((e) => VillainGenerator.generate(e, random)).toList();
  }

  static List<God> _generateGods(Random random) {
    List<God> gods = [];
    for (String s2 in ["Good", "Neutral", "Evil"]) {
      for (String s1 in ["Lawful", "True", "Chaotic"]) {
        gods.add(GodGenerator.generate("$s1 $s2", random));
      }
    }
    return gods;
  }

  static List<String> _generateLore(Random random) {
    getString() {
      NatureLocationType type = random.chooseFrom(NatureLocationType.values);
      List<String> pool = List.from(
          encounterObject[type]!["int"]! + encounterObject[type]!["mon"]!);
      String s = random.chooseFrom(peopleKnowsAndBelifes);
      String creature = random.chooseFrom(pool);
      while (creature.startsWith("a ") || creature.startsWith("an ")) {
        pool.remove(creature);
        creature = random.chooseFrom(pool);
      }
      return s
          .replaceAll("MONSTER", creature)
          .replaceAll("RACE", random.chooseFrom(Race.values).pluralName)
          .replaceAll("ITEM", random.chooseFrom(items))
          .replaceAll(
              "VILLAIN", random.chooseFrom(VillainRace.values).pluralName)
          .replaceAll("LOCATION", type.name);
    }

    List<String> knb = [];
    late String s;
    for (int _ in List.generate(5, (_) => _)) {
      s = getString();
      while (knb.contains(s)) {
        s = getString();
      }
      knb.add(s);
    }
    return knb;
  }
}
