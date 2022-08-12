import 'dart:math';

import 'package:rpgsolo/classes/npcs/background.dart';
import 'package:rpgsolo/classes/npcs/relative.dart';
import 'package:rpgsolo/data/npcs/backstory_data.dart';
import 'package:rpgsolo/data/races.dart';
import 'package:rpgsolo/generator/npcs/relative_generator.dart';
import 'package:rpgsolo/utils/extensions.dart';

class BackgroundGenerator {
  static Background generate(
      VillainRace race, bool isMale, String name, String alignment,
      [Random? random]) {
    Random rand = random ?? Random();
    String surname = name.split(" ").sublist(1).join(" ");
    List res = _generateParents(race, isMale, surname, alignment, rand);
    String parents = res[0];
    Relative? mother = res[1], father = res[2];
    String birthplace = _generateBirthplace(isMale, rand);
    List<Relative> sibilings =
        _generateSibilings(race, surname, alignment, rand);
    String raisedBy = _generateRaisedBy(father != null, isMale, rand);
    res = _generateLifestyle(rand);
    String lifestyle = res[0], home = res[1];
    String memory = rand
        .chooseFrom(childhoodMemories)
        .replaceAll("PRON", isMale ? "he" : "she")
        .replaceAll("REL", isMale ? "his" : "her");
    Background background = Background(
        parents: parents,
        mother: mother,
        father: father,
        birthplace: birthplace,
        sibilings: sibilings,
        raisedBy: raisedBy,
        lifestyle: lifestyle,
        home: home,
        memory: memory);
    return background;
  }

  static List _generateParents(VillainRace race, bool isMale, String surname,
      String alignment, Random random) {
    late String parents;
    Relative? mother, father;
    if (random.nextInt(100) < 96) {
      parents = "knows who ${isMale ? "his" : "her"} parents are";
      if (race == VillainRace.halfElf) {
        parents += ". ${random.chooseFrom(halfElfParents)}";
      } else if (race == VillainRace.halfOrc) {
        parents += ". ${random.chooseFrom(halfOrcParents)}";
      } else if (race == VillainRace.tiefling) {
        parents +=
            ". ${random.chooseFrom(tieflingParents).replaceAll("PRON", isMale ? "he" : "she")}";
      } else if (race == VillainRace.halfDrow) {
        parents += ". ${random.chooseFrom(halfDrowParents)}";
      }
      mother = RelativeGenerator.generate(
          "mother", surname, race, alignment, false, random);
      father = RelativeGenerator.generate(
          "father", surname, race, alignment, true, random);
    } else {
      parents = "doesn't know who ${isMale ? "his" : "her"} parents were";
    }
    return [parents, mother, father];
  }

  static String _generateBirthplace(bool isMale, Random random) {
    if (random.nextBool()) {
      return "at ${isMale ? "his" : "her"} home";
    } else {
      return random.chooseFrom(exoticBirthplace);
    }
  }

  static List<Relative> _generateSibilings(
      VillainRace race, String surname, String alignment, Random random) {
    return List.generate(random.nextInt(5), (_) {
      bool isMale = random.nextBool();
      String title = isMale ? "brother" : "sister";
      String role = random.chooseFrom([
        "younger $title",
        "older $title",
        "younger $title",
        "older $title",
        "twin $title"
      ]);
      return RelativeGenerator.generate(
          role, surname, race, alignment, isMale, random);
    });
  }

  static String _generateRaisedBy(
      bool regularOption, bool isMale, Random random) {
    if (regularOption && random.nextBool()) {
      return random.chooseFrom(regularFamily);
    }
    String rel = isMale ? "his" : "her";
    String raisedBy =
        "${random.chooseFrom(exoticFamilty)} because $rel ${random.chooseFrom(absentParents)}";
    return raisedBy.replaceAll("REL", rel).replaceAll(
        "died",
        random
            .chooseFrom(deathCause)
            .replaceAll("BEVERB", "were")
            .replaceAll("REL", "their"));
  }

  static List<String> _generateLifestyle(Random random) {
    String lifestyle = random.chooseFrom(familyLifestyle.keys.toList());
    int modifier = familyLifestyle[lifestyle] ?? 0;
    int val = random.nextInt(100) + 1 + modifier;
    String home = "in a palace";
    for (int threshhold in childhoodHome.keys.toList()) {
      if (val <= threshhold) {
        home = childhoodHome[threshhold] ?? home;
        break;
      }
    }
    return [lifestyle, home];
  }
}
