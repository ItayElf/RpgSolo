import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/villains/villain_action.dart';
import 'package:rpgsolo/data/nature_location_data.dart';
import 'package:rpgsolo/data/races.dart';
import 'package:rpgsolo/data/towns/locations_data.dart';
import 'package:rpgsolo/data/towns/town_data.dart';
import 'package:rpgsolo/data/villains/villain_data.dart';

extension StringExtension on String {
  String toTitleCase() {
    title(s) =>
        s == "" ? "" : "${s[0].toUpperCase()}${s.substring(1).toLowerCase()}";
    return split(" ").map(title).join(" ");
  }
}

extension RaceExtention on Race {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name};
  }

  String get printedName => name == "halfElf"
      ? "half-elf"
      : name == "halfOrc"
          ? "half-orc"
          : name;
  String get pluralName => name == "halfElf"
      ? "half-elves"
      : name == "elf"
          ? "elves"
          : "${printedName}s";
}

extension VillainRaceExtention on VillainRace {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name};
  }

  String get printedName =>
      {
        "halfElf": "half-elf",
        "halfOrc": "half-orc",
        "halfDrow": "half-drow",
        "yuanTi": "yuan-ti"
      }[name] ??
      name;

  String get pluralName => name == "halfElf"
      ? "half-elves"
      : name == "elf"
          ? "elves"
          : "${printedName}s";

  bool get isNormalRace => Race.values.map((e) => e.name).contains(name);
  Race get asRace =>
      Race.values.firstWhere((e) => e.toString() == "Race.$name");
}

extension LocationTypeExtension on LocationType {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name};
  }

  String get printedName => name == "generalStore" ? "general store" : name;
}

extension TownTypeExtension on TownType {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name};
  }
}

extension ActionResultExtension on ActionResult {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name};
  }
}

extension NatureLocationTypeExtension on NatureLocationType {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name};
  }
}

extension VillainPowerExtension on VillainPower {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name};
  }

  String get printedName =>
      {
        "nuisance": "a nuisance villain",
        "local": "a local villain",
        "regional": "a regional villain",
        "national": "a national villain",
        "archvillain": "an archvillain"
      }[name] ??
      name;
}

class SlideRoute extends MaterialPageRoute {
  SlideRoute({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
          .animate(animation),
      child: child,
    );
  }
}
