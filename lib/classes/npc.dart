// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rpgsolo/data/races.dart';

class Npc {
  final String name;
  final int age;
  final bool isMale;
  final Race race;
  final String occupation;
  final String orientation;
  final String relationshipStatus;
  final String hook;
  Npc({
    required this.name,
    required this.age,
    required this.isMale,
    required this.race,
    required this.occupation,
    required this.orientation,
    required this.relationshipStatus,
    required this.hook,
  });

  String get pronoun => isMale ? "he" : "she";
  String get relPronoun => isMale ? "his" : "her";

  Npc copyWith({
    String? name,
    int? age,
    bool? isMale,
    Race? race,
    String? occupation,
    String? orientation,
    String? relationshipStatus,
    String? hook,
  }) {
    return Npc(
      name: name ?? this.name,
      age: age ?? this.age,
      isMale: isMale ?? this.isMale,
      race: race ?? this.race,
      occupation: occupation ?? this.occupation,
      orientation: orientation ?? this.orientation,
      relationshipStatus: relationshipStatus ?? this.relationshipStatus,
      hook: hook ?? this.hook,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'isMale': isMale,
      'race': race.toMap(),
      'occupation': occupation,
      'orientation': orientation,
      'relationshipStatus': relationshipStatus,
      'hook': hook,
    };
  }

  factory Npc.fromMap(Map<String, dynamic> map) {
    return Npc(
      name: map['name'] as String,
      age: map['age'] as int,
      isMale: map['isMale'] as bool,
      race: Race.values.firstWhere(
          (element) => element.toString() == "Race.${map["race"]["name"]}"),
      occupation: map['occupation'] as String,
      orientation: map['orientation'] as String,
      relationshipStatus: map['relationshipStatus'] as String,
      hook: map['hook'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Npc.fromJson(String source) =>
      Npc.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Npc(name: $name, age: $age, isMale: $isMale, race: $race, occupation: $occupation, orientation: $orientation, relationshipStatus: $relationshipStatus, hook: $hook)';
  }

  @override
  bool operator ==(covariant Npc other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.age == age &&
        other.isMale == isMale &&
        other.race == race &&
        other.occupation == occupation &&
        other.orientation == orientation &&
        other.relationshipStatus == relationshipStatus &&
        other.hook == hook;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        age.hashCode ^
        isMale.hashCode ^
        race.hashCode ^
        occupation.hashCode ^
        orientation.hashCode ^
        relationshipStatus.hashCode ^
        hook.hashCode;
  }
}
