// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:rpgsolo/classes/npcs/background.dart';
import 'package:rpgsolo/classes/npcs/personality.dart';
import 'package:rpgsolo/classes/npcs/physical.dart';
import 'package:rpgsolo/classes/villains/villain_action.dart';
import 'package:rpgsolo/classes/villains/villain_motives.dart';
import 'package:rpgsolo/data/races.dart';
import 'package:rpgsolo/data/villains/villain_data.dart';
import 'package:rpgsolo/utils/extensions.dart';

class Villain {
  final String name;
  final int age;
  final bool isMale;
  final VillainPower power;
  final VillainRace race;
  final String occupation;
  final String orientation;
  final String relationshipStatus;
  final Physical physical;
  final Personality personality;
  final VillainMotives motives;
  final List<VillainAction> actions;
  final Background background;
  Villain({
    required this.name,
    required this.age,
    required this.isMale,
    required this.power,
    required this.race,
    required this.occupation,
    required this.orientation,
    required this.relationshipStatus,
    required this.physical,
    required this.personality,
    required this.motives,
    required this.actions,
    required this.background,
  });

  String get pronoun => isMale ? "he" : "she";
  String get relPronoun => isMale ? "his" : "her";
  String get firstName => name.split(" ")[0];

  Villain copyWith({
    String? name,
    int? age,
    bool? isMale,
    VillainPower? power,
    VillainRace? race,
    String? occupation,
    String? orientation,
    String? relationshipStatus,
    Physical? physical,
    Personality? personality,
    VillainMotives? motives,
    List<VillainAction>? actions,
    Background? background,
  }) {
    return Villain(
      name: name ?? this.name,
      age: age ?? this.age,
      isMale: isMale ?? this.isMale,
      power: power ?? this.power,
      race: race ?? this.race,
      occupation: occupation ?? this.occupation,
      orientation: orientation ?? this.orientation,
      relationshipStatus: relationshipStatus ?? this.relationshipStatus,
      physical: physical ?? this.physical,
      personality: personality ?? this.personality,
      motives: motives ?? this.motives,
      actions: actions ?? this.actions,
      background: background ?? this.background,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'isMale': isMale,
      'power': power.toMap(),
      'race': race.toMap(),
      'occupation': occupation,
      'orientation': orientation,
      'relationshipStatus': relationshipStatus,
      'physical': physical.toMap(),
      'personality': personality.toMap(),
      'motives': motives.toMap(),
      'actions': actions.map((x) => x.toMap()).toList(),
      'background': background.toMap(),
    };
  }

  factory Villain.fromMap(Map<String, dynamic> map) {
    return Villain(
      name: map['name'] as String,
      age: map['age'] as int,
      isMale: map['isMale'] as bool,
      power: VillainPower.values.firstWhere((element) =>
          element.toString() == "VillainPower.${map["power"]["name"]}"),
      race: VillainRace.values.firstWhere((element) =>
          element.toString() == "VillainRace.${map["race"]["name"]}"),
      occupation: map['occupation'] as String,
      orientation: map['orientation'] as String,
      relationshipStatus: map['relationshipStatus'] as String,
      physical: Physical.fromMap(map['physical'] as Map<String, dynamic>),
      personality:
          Personality.fromMap(map['personality'] as Map<String, dynamic>),
      motives: VillainMotives.fromMap(map['motives'] as Map<String, dynamic>),
      actions: List<VillainAction>.from(
        (map['actions']).map<VillainAction>(
          (x) => VillainAction.fromMap(x as Map<String, dynamic>),
        ),
      ),
      background: Background.fromMap(map['background'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Villain.fromJson(String source) =>
      Villain.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Villain(name: $name, age: $age, isMale: $isMale, power: $power, race: $race, occupation: $occupation, orientation: $orientation, relationshipStatus: $relationshipStatus, physical: $physical, personality: $personality, motives: $motives, actions: $actions, background: $background)';
  }

  @override
  bool operator ==(covariant Villain other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.age == age &&
        other.isMale == isMale &&
        other.power == power &&
        other.race == race &&
        other.occupation == occupation &&
        other.orientation == orientation &&
        other.relationshipStatus == relationshipStatus &&
        other.physical == physical &&
        other.personality == personality &&
        other.motives == motives &&
        listEquals(other.actions, actions) &&
        other.background == background;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        age.hashCode ^
        isMale.hashCode ^
        power.hashCode ^
        race.hashCode ^
        occupation.hashCode ^
        orientation.hashCode ^
        relationshipStatus.hashCode ^
        physical.hashCode ^
        personality.hashCode ^
        motives.hashCode ^
        actions.hashCode ^
        background.hashCode;
  }
}
