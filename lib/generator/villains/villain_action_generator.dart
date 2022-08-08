import 'dart:math';

import 'package:rpgsolo/classes/villains/villain_action.dart';
import 'package:rpgsolo/data/villains/villain_action_data.dart';
import 'package:rpgsolo/utils/extensions.dart';

class VillainActionGenerator {
  static VillainAction generate(String name, bool isMale, [Random? random]) {
    Random rand = random ?? Random();
    String type = actionDataObject.keys
        .toList()[rand.nextInt(actionDataObject.keys.length)];
    String actionDescription = _generateDescription(type, name, isMale, rand);
    ActionResult result = _generateActionResult(rand);
    String resultDescription =
        _generateResultDescription(type, name, isMale, result, rand);
    VillainAction action = VillainAction(
        type: type,
        actionDescription: actionDescription,
        result: result,
        resultDescription: resultDescription);
    return action;
  }

  static String _generateDescription(
      String type, String name, bool isMale, Random random) {
    String actionDescription = actionDataObject[type]!["desc"]![
        random.nextInt(actionDataObject[type]!["desc"]!.length)];
    actionDescription = actionDescription
        .replaceAll("NAME", name.split(" ")[0].toTitleCase())
        .replaceAll("PRON", isMale ? "he" : "she")
        .replaceAll("REL", isMale ? "his" : "her");
    actionDescription =
        actionDescription[0].toUpperCase() + actionDescription.substring(1);
    if (!actionDescription.endsWith(".")) {
      actionDescription += ".";
    }
    return actionDescription;
  }

  static ActionResult _generateActionResult(Random random) {
    int rand = random.nextInt(10);
    if (rand < 3) {
      return ActionResult.defeat;
    } else if (rand < 5) {
      return ActionResult.draw;
    }
    return ActionResult.victory;
  }

  static String _generateResultDescription(String type, String name,
      bool isMale, ActionResult result, Random random) {
    String res = result == ActionResult.victory
        ? "onVictory"
        : result == ActionResult.draw
            ? "onDraw"
            : "onDefeat";
    String resultDescription = actionDataObject[type]![res]![
        random.nextInt(actionDataObject[type]![res]!.length)];
    resultDescription = resultDescription
        .replaceAll("NAME", name.split(" ")[0].toTitleCase())
        .replaceAll("PRON", isMale ? "he" : "she")
        .replaceAll("REL", isMale ? "his" : "her");
    resultDescription =
        resultDescription[0].toUpperCase() + resultDescription.substring(1);
    if (!resultDescription.endsWith(".")) {
      resultDescription += ".";
    }
    return resultDescription;
  }
}
