import 'dart:math';

import 'package:rpgsolo/classes/encounter.dart';
import 'package:rpgsolo/data/encounter_data.dart';
import 'package:rpgsolo/data/nature_location_data.dart';
import 'package:rpgsolo/utils/extensions.dart';

class EncounterGenerator {
  static Encounter generate(
      [NatureLocationType? natureLocationType, Random? random]) {
    Random rand = random ?? Random();
    NatureLocationType locationType =
        natureLocationType ?? rand.chooseFrom(NatureLocationType.values);
    Map<String, List<String>> pool = encounterObject[locationType] ?? {};
    String type = pool.keys.toList()[rand.nextInt(pool.length)];
    String encounter = pool[type]![rand.nextInt(pool[type]!.length)];
    late String description, benefit;
    if (type == "int") {
      description = intelligentEncounterDescription[
          rand.nextInt(intelligentEncounterDescription.length)];
      benefit = intelligentEncounterBenefit[
          rand.nextInt(intelligentEncounterBenefit.length)];
    } else if (type == "mon") {
      description = monsterEncounterDescription[
          rand.nextInt(monsterEncounterDescription.length)];
      benefit = rand.chooseFrom(monsterEncounterBenefit);
    } else {
      description = "";
      benefit = "";
    }
    Encounter e = Encounter(
        locationType: locationType,
        encounter: encounter,
        description: description,
        benefit: benefit);
    return e;
  }
}
