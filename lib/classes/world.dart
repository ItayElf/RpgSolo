// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:rpgsolo/classes/god.dart';
import 'package:rpgsolo/classes/nature_location.dart';
import 'package:rpgsolo/classes/npcs/npc.dart';
import 'package:rpgsolo/classes/towns/town.dart';
import 'package:rpgsolo/classes/villains/villain.dart';

class World {
  final String name;
  final List<Town> towns; // 1 metropolis, 3 cities, 3 towns and 2 villages
  final List<NatureLocation> terrain; // 5 - 7
  final Map<String, String> oppinions;
  final List<Npc> importantPeople; // 3 - 5
  final List<Villain> villains; // 1 archvillain, 2 national / regional, 2 local
  final List<God> gods; // one for each alignment
  final List<String> loreItems;
  World({
    required this.name,
    required this.towns,
    required this.terrain,
    required this.oppinions,
    required this.importantPeople,
    required this.villains,
    required this.gods,
    required this.loreItems,
  });

  World copyWith({
    String? name,
    List<Town>? towns,
    List<NatureLocation>? terrain,
    Map<String, String>? oppinions,
    List<Npc>? importantPeople,
    List<Villain>? villains,
    List<God>? gods,
    List<String>? loreItems,
  }) {
    return World(
      name: name ?? this.name,
      towns: towns ?? this.towns,
      terrain: terrain ?? this.terrain,
      oppinions: oppinions ?? this.oppinions,
      importantPeople: importantPeople ?? this.importantPeople,
      villains: villains ?? this.villains,
      gods: gods ?? this.gods,
      loreItems: loreItems ?? this.loreItems,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'towns': towns.map((x) => x.toMap()).toList(),
      'terrain': terrain.map((x) => x.toMap()).toList(),
      'oppinions': oppinions,
      'importantPeople': importantPeople.map((x) => x.toMap()).toList(),
      'villains': villains.map((x) => x.toMap()).toList(),
      'gods': gods.map((x) => x.toMap()).toList(),
      'loreItems': loreItems,
    };
  }

  factory World.fromMap(Map<String, dynamic> map) {
    return World(
      name: map['name'] as String,
      towns: List<Town>.from(
        (map['towns']).map<Town>(
          (x) => Town.fromMap(x as Map<String, dynamic>),
        ),
      ),
      terrain: List<NatureLocation>.from(
        (map['terrain']).map<NatureLocation>(
          (x) => NatureLocation.fromMap(x as Map<String, dynamic>),
        ),
      ),
      oppinions: Map<String, String>.from(map['oppinions']),
      importantPeople: List<Npc>.from(
        (map['importantPeople']).map<Npc>(
          (x) => Npc.fromMap(x as Map<String, dynamic>),
        ),
      ),
      villains: List<Villain>.from(
        (map['villains']).map<Villain>(
          (x) => Villain.fromMap(x as Map<String, dynamic>),
        ),
      ),
      gods: List<God>.from(
        (map['gods']).map<God>(
          (x) => God.fromMap(x as Map<String, dynamic>),
        ),
      ),
      loreItems: List<String>.from(map['loreItems']),
    );
  }

  String toJson() => json.encode(toMap());

  factory World.fromJson(String source) =>
      World.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'World(name: $name, towns: $towns, terrain: $terrain, oppinions: $oppinions, importantPeople: $importantPeople, villains: $villains, gods: $gods, loreItems: $loreItems)';
  }

  @override
  bool operator ==(covariant World other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        listEquals(other.towns, towns) &&
        listEquals(other.terrain, terrain) &&
        mapEquals(other.oppinions, oppinions) &&
        listEquals(other.importantPeople, importantPeople) &&
        listEquals(other.villains, villains) &&
        listEquals(other.gods, gods) &&
        listEquals(other.loreItems, loreItems);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        towns.hashCode ^
        terrain.hashCode ^
        oppinions.hashCode ^
        importantPeople.hashCode ^
        villains.hashCode ^
        gods.hashCode ^
        loreItems.hashCode;
  }
}
