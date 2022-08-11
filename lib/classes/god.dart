// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rpgsolo/data/races.dart';
import 'package:rpgsolo/utils/extensions.dart';

class God {
  final String name;
  final bool isMale;
  final String trait1;
  final String? trait2;
  final String alignment;
  final String depiction;
  final VillainRace? race;
  final String worshippers;
  final String occupation;
  final String shrines;
  final String otherSee;
  final String worshipSee;
  God({
    required this.name,
    required this.isMale,
    required this.trait1,
    this.trait2,
    required this.alignment,
    required this.depiction,
    this.race,
    required this.worshippers,
    required this.occupation,
    required this.shrines,
    required this.otherSee,
    required this.worshipSee,
  });

  God copyWith({
    String? name,
    bool? isMale,
    String? trait1,
    String? trait2,
    String? alignment,
    String? depiction,
    VillainRace? race,
    String? worshippers,
    String? occupation,
    String? shrines,
    String? otherSee,
    String? worshipSee,
  }) {
    return God(
      name: name ?? this.name,
      isMale: isMale ?? this.isMale,
      trait1: trait1 ?? this.trait1,
      trait2: trait2 ?? this.trait2,
      alignment: alignment ?? this.alignment,
      depiction: depiction ?? this.depiction,
      race: race ?? this.race,
      worshippers: worshippers ?? this.worshippers,
      occupation: occupation ?? this.occupation,
      shrines: shrines ?? this.shrines,
      otherSee: otherSee ?? this.otherSee,
      worshipSee: worshipSee ?? this.worshipSee,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'isMale': isMale,
      'trait1': trait1,
      'trait2': trait2,
      'alignment': alignment,
      'depiction': depiction,
      'race': race?.toMap(),
      'worshippers': worshippers,
      'occupation': occupation,
      'shrines': shrines,
      'otherSee': otherSee,
      'worshipSee': worshipSee,
    };
  }

  factory God.fromMap(Map<String, dynamic> map) {
    return God(
      name: map['name'] as String,
      isMale: map['isMale'] as bool,
      trait1: map['trait1'] as String,
      trait2: map['trait2'] != null ? map['trait2'] as String : null,
      alignment: map['alignment'] as String,
      depiction: map['depiction'] as String,
      race: map['race'] != null
          ? VillainRace.values.firstWhere((element) =>
              element.toString() == "VillainRace.${map["race"]["name"]}")
          : null,
      worshippers: map['worshippers'] as String,
      occupation: map['occupation'] as String,
      shrines: map['shrines'] as String,
      otherSee: map['otherSee'] as String,
      worshipSee: map['worshipSee'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory God.fromJson(String source) =>
      God.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'God(name: $name, isMale: $isMale, trait1: $trait1, trait2: $trait2, alignment: $alignment, depiction: $depiction, race: $race, worshippers: $worshippers, occupation: $occupation, shrines: $shrines, otherSee: $otherSee, worshipSee: $worshipSee)';
  }

  @override
  bool operator ==(covariant God other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.isMale == isMale &&
        other.trait1 == trait1 &&
        other.trait2 == trait2 &&
        other.alignment == alignment &&
        other.depiction == depiction &&
        other.race == race &&
        other.worshippers == worshippers &&
        other.occupation == occupation &&
        other.shrines == shrines &&
        other.otherSee == otherSee &&
        other.worshipSee == worshipSee;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        isMale.hashCode ^
        trait1.hashCode ^
        trait2.hashCode ^
        alignment.hashCode ^
        depiction.hashCode ^
        race.hashCode ^
        worshippers.hashCode ^
        occupation.hashCode ^
        shrines.hashCode ^
        otherSee.hashCode ^
        worshipSee.hashCode;
  }
}
