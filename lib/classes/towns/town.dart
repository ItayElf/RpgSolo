// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:rpgsolo/classes/npcs/npc.dart';
import 'package:rpgsolo/classes/towns/location.dart';
import 'package:rpgsolo/data/races.dart';
import 'package:rpgsolo/data/towns/town_data.dart';
import 'package:rpgsolo/utils/extensions.dart';

class Town {
  final String name;
  final TownType townType;
  final Race mainRace;
  final List<Location> locations;
  final String description;
  final String occupation;
  final List<Npc> npcs;
  final int population;
  final List<String> sidequests;
  Town({
    required this.name,
    required this.townType,
    required this.mainRace,
    required this.locations,
    required this.description,
    required this.occupation,
    required this.npcs,
    required this.population,
    required this.sidequests,
  });

  Town copyWith({
    String? name,
    TownType? townType,
    Race? mainRace,
    List<Location>? locations,
    String? description,
    String? occupation,
    List<Npc>? npcs,
    int? population,
    List<String>? sidequests,
  }) {
    return Town(
      name: name ?? this.name,
      townType: townType ?? this.townType,
      mainRace: mainRace ?? this.mainRace,
      locations: locations ?? this.locations,
      description: description ?? this.description,
      occupation: occupation ?? this.occupation,
      npcs: npcs ?? this.npcs,
      population: population ?? this.population,
      sidequests: sidequests ?? this.sidequests,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'townType': townType.toMap(),
      'mainRace': mainRace.toMap(),
      'locations': locations.map((x) => x.toMap()).toList(),
      'description': description,
      'occupation': occupation,
      'npcs': npcs.map((x) => x.toMap()).toList(),
      'population': population,
      'sidequests': sidequests,
    };
  }

  factory Town.fromMap(Map<String, dynamic> map) {
    return Town(
      name: map['name'] as String,
      townType: TownType.values.firstWhere((element) =>
          element.toString() == "TownType.${map["townType"]["name"]}"),
      mainRace: Race.values.firstWhere(
          (element) => element.toString() == "Race.${map["mainRace"]["name"]}"),
      locations: List<Location>.from(
        (map['locations'] as List<int>).map<Location>(
          (x) => Location.fromMap(x as Map<String, dynamic>),
        ),
      ),
      description: map['description'] as String,
      occupation: map['occupation'] as String,
      npcs: List<Npc>.from(
        (map['npcs'] as List<int>).map<Npc>(
          (x) => Npc.fromMap(x as Map<String, dynamic>),
        ),
      ),
      population: map['population'] as int,
      sidequests: List<String>.from(
        (map['sidequests'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Town.fromJson(String source) =>
      Town.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Town(name: $name, townType: $townType, mainRace: $mainRace, locations: $locations, description: $description, occupation: $occupation, npcs: $npcs, population: $population, sidequests: $sidequests)';
  }

  @override
  bool operator ==(covariant Town other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.townType == townType &&
        other.mainRace == mainRace &&
        listEquals(other.locations, locations) &&
        other.description == description &&
        other.occupation == occupation &&
        listEquals(other.npcs, npcs) &&
        other.population == population &&
        listEquals(other.sidequests, sidequests);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        townType.hashCode ^
        mainRace.hashCode ^
        locations.hashCode ^
        description.hashCode ^
        occupation.hashCode ^
        npcs.hashCode ^
        population.hashCode ^
        sidequests.hashCode;
  }
}
