import 'dart:convert';

import 'package:rpgsolo/classes/encounter.dart';
import 'package:rpgsolo/classes/god.dart';
import 'package:rpgsolo/classes/nature_location.dart';
import 'package:rpgsolo/classes/npcs/npc.dart';
import 'package:rpgsolo/classes/towns/location.dart';
import 'package:rpgsolo/classes/towns/town.dart';
import 'package:rpgsolo/classes/villains/villain.dart';
import 'package:rpgsolo/classes/world.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemSaver {
  static final _baseObject = {
    "npcs": [],
    "buildings": [],
    "settlements": [],
    "villains": [],
    "encounters": [],
    "landscapes": [],
    "gods": [],
    "worlds": [],
  };

  static final _convertionObject = {
    "npcs": Npc.fromMap,
    "buildings": Location.fromMap,
    "settlements": Town.fromMap,
    "villains": Villain.fromMap,
    "encounters": Encounter.fromMap,
    "landscapes": NatureLocation.fromMap,
    "gods": God.fromMap,
    "worlds": World.fromMap,
  };

  static Future<Map<String, List>> getSavedItems() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedString = prefs.getString("saved");
    if (savedString == null) {
      await prefs.setString("saved", jsonEncode(_baseObject));
      return _baseObject;
    }
    Map<String, List> saved = Map<String, List>.from(jsonDecode(savedString));
    bool shouldSave = false;
    for (String k in _baseObject.keys) {
      if (!saved.containsKey(k)) {
        saved[k] = [];
        shouldSave = true;
      }
      saved[k] = saved[k]?.map((e) => _convertionObject[k]!(e)).toList() ?? [];
    }
    if (shouldSave) {
      await _saveSavedItems(saved);
    }
    return saved;
  }

  static Future<void> _saveSavedItems(Map<String, List> saved) async {
    final prefs = await SharedPreferences.getInstance();
    for (String k in saved.keys) {
      saved[k] = saved[k]?.map((e) => e.toMap()).toList() ?? [];
    }
    await prefs.setString("saved", jsonEncode(saved));
  }

  static Future<void> _saveTo(String key, dynamic value) async {
    Map<String, List> saved = await getSavedItems();
    saved[key]!.add(value);
    await _saveSavedItems(saved);
  }

  static Future<bool> _removeFrom(String key, dynamic value) async {
    Map<String, List> saved = await getSavedItems();
    bool res = saved[key]!.remove(value);
    await _saveSavedItems(saved);
    return res;
  }

  static Future<void> saveNpc(Npc npc) async {
    await _saveTo("npcs", npc);
  }

  static Future<bool> removeNpc(Npc npc) async {
    return await _removeFrom("npcs", npc);
  }

  static Future<void> saveBuilding(Location location) async {
    await _saveTo("buildings", location);
  }

  static Future<bool> removeBuilding(Location location) async {
    return await _removeFrom("buildings", location);
  }

  static Future<void> saveSettlement(Town town) async {
    await _saveTo("settlements", town);
  }

  static Future<bool> removeSettlement(Town town) async {
    return await _removeFrom("settlements", town);
  }

  static Future<void> saveVillain(Villain villain) async {
    await _saveTo("villains", villain);
  }

  static Future<bool> removeVillain(Villain villain) async {
    return await _removeFrom("villains", villain);
  }

  static Future<void> saveEncounter(Encounter encounter) async {
    await _saveTo("encounters", encounter);
  }

  static Future<bool> removeEncounter(Encounter encounter) async {
    return await _removeFrom("encounters", encounter);
  }

  static Future<void> saveLandsacpe(NatureLocation natureLocation) async {
    await _saveTo("landscapes", natureLocation);
  }

  static Future<bool> removeLandscape(NatureLocation natureLocation) async {
    return await _removeFrom("landscapes", natureLocation);
  }

  static Future<void> saveGod(God god) async {
    await _saveTo("gods", god);
  }

  static Future<bool> removeGod(God god) async {
    return await _removeFrom("gods", god);
  }

  static Future<void> saveWorld(World world) async {
    await _saveTo("worlds", world);
  }

  static Future<bool> removeWorld(World world) async {
    return await _removeFrom("worlds", world);
  }
}
