// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:rpgsolo/classes/npcs/relative.dart';

class Background {
  final String parents;
  final Relative? mother;
  final Relative? father;
  final String birthplace;
  final List<Relative> sibilings;
  final String raisedBy;
  final String lifestyle;
  final String home;
  final String memory;
  Background({
    required this.parents,
    this.mother,
    this.father,
    required this.birthplace,
    required this.sibilings,
    required this.raisedBy,
    required this.lifestyle,
    required this.home,
    required this.memory,
  });

  Background copyWith({
    String? parents,
    Relative? mother,
    Relative? father,
    String? birthplace,
    List<Relative>? sibilings,
    String? raisedBy,
    String? lifestyle,
    String? home,
    String? memory,
  }) {
    return Background(
      parents: parents ?? this.parents,
      mother: mother ?? this.mother,
      father: father ?? this.father,
      birthplace: birthplace ?? this.birthplace,
      sibilings: sibilings ?? this.sibilings,
      raisedBy: raisedBy ?? this.raisedBy,
      lifestyle: lifestyle ?? this.lifestyle,
      home: home ?? this.home,
      memory: memory ?? this.memory,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'parents': parents,
      'mother': mother?.toMap(),
      'father': father?.toMap(),
      'birthplace': birthplace,
      'sibilings': sibilings.map((x) => x.toMap()).toList(),
      'raisedBy': raisedBy,
      'lifestyle': lifestyle,
      'home': home,
      'memory': memory,
    };
  }

  factory Background.fromMap(Map<String, dynamic> map) {
    return Background(
      parents: map['parents'] as String,
      mother: map['mother'] != null
          ? Relative.fromMap(map['mother'] as Map<String, dynamic>)
          : null,
      father: map['father'] != null
          ? Relative.fromMap(map['father'] as Map<String, dynamic>)
          : null,
      birthplace: map['birthplace'] as String,
      sibilings: List<Relative>.from(
        (map['sibilings'] as List).map<Relative>(
          (x) => Relative.fromMap(x as Map<String, dynamic>),
        ),
      ),
      raisedBy: map['raisedBy'] as String,
      lifestyle: map['lifestyle'] as String,
      home: map['home'] as String,
      memory: map['memory'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Background.fromJson(String source) =>
      Background.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Background(parents: $parents, mother: $mother, father: $father, birthplace: $birthplace, sibilings: $sibilings, raisedBy: $raisedBy, lifestyle: $lifestyle, home: $home, memory: $memory)';
  }

  @override
  bool operator ==(covariant Background other) {
    if (identical(this, other)) return true;

    return other.parents == parents &&
        other.mother == mother &&
        other.father == father &&
        other.birthplace == birthplace &&
        listEquals(other.sibilings, sibilings) &&
        other.raisedBy == raisedBy &&
        other.lifestyle == lifestyle &&
        other.home == home &&
        other.memory == memory;
  }

  @override
  int get hashCode {
    return parents.hashCode ^
        mother.hashCode ^
        father.hashCode ^
        birthplace.hashCode ^
        sibilings.hashCode ^
        raisedBy.hashCode ^
        lifestyle.hashCode ^
        home.hashCode ^
        memory.hashCode;
  }
}
