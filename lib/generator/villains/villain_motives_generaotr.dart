import 'dart:math';

import 'package:rpgsolo/classes/villains/villain_motives.dart';
import 'package:rpgsolo/data/villains/villain_motives_data.dart';
import 'package:rpgsolo/utils/extensions.dart';

class VillainMotivesGenerator {
  static VillainMotives generate(bool isMale, [Random? random]) {
    Random rand = random ?? Random();
    String goal = rand
        .chooseFrom(villainGoals)
        .replaceAll("REL", isMale ? "his" : "her")
        .toLowerCase();
    String motivation = rand
        .chooseFrom(villainMotivation)
        .replaceAll("REL", isMale ? "his" : "her")
        .toLowerCase();
    String flaw = rand.chooseFrom(villainFlaws).toLowerCase();
    String weakness = rand.chooseFrom(villainWeaknesses).toLowerCase();
    String friends = rand.chooseFrom(villainFriends).toLowerCase();
    String allies = rand.chooseFrom(villainAllies).toLowerCase();
    String special = rand.chooseFrom(villainSpecial).toLowerCase();
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
