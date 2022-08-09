import 'dart:math';

import 'package:rpgsolo/classes/villains/villain_motives.dart';
import 'package:rpgsolo/data/villains/villain_motives_data.dart';

class VillainMotivesGenerator {
  static VillainMotives generate(bool isMale, [Random? random]) {
    Random rand = random ?? Random();
    String goal = villainGoals[rand.nextInt(villainGoals.length)]
        .replaceAll("REL", isMale ? "his" : "her")
        .toLowerCase();
    String motivation =
        villainMotivation[rand.nextInt(villainMotivation.length)]
            .replaceAll("REL", isMale ? "his" : "her")
            .toLowerCase();
    String flaw = villainFlaws[rand.nextInt(villainFlaws.length)].toLowerCase();
    String weakness =
        villainWeaknesses[rand.nextInt(villainWeaknesses.length)].toLowerCase();
    String friends =
        villainFriends[rand.nextInt(villainFriends.length)].toLowerCase();
    String allies =
        villainAllies[rand.nextInt(villainAllies.length)].toLowerCase();
    String special =
        villainSpecial[rand.nextInt(villainSpecial.length)].toLowerCase();
    VillainMotives motives = VillainMotives(
        goal: goal,
        motivation: motivation,
        flaw: flaw,
        weakness: weakness,
        friends: friends,
        allies: allies,
        special: special);
    return motives;
  }
}
