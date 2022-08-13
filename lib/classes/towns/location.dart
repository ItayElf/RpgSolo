// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:rpgsolo/classes/npcs/npc.dart';
import 'package:rpgsolo/classes/towns/goods.dart';
import 'package:rpgsolo/data/towns/locations_data.dart';
import 'package:rpgsolo/utils/extensions.dart';

class Location {
  final String name;
  final Npc owner;
  final String location;
  final String description;
  final LocationType type;
  final List<Goods> goods;
  Location({
    required this.name,
    required this.owner,
    required this.location,
    required this.description,
    required this.type,
    required this.goods,
  });

  Location copyWith({
    String? name,
    Npc? owner,
    String? location,
    String? description,
    LocationType? type,
    List<Goods>? goods,
  }) {
    return Location(
      name: name ?? this.name,
      owner: owner ?? this.owner,
      location: location ?? this.location,
      description: description ?? this.description,
      type: type ?? this.type,
      goods: goods ?? this.goods,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'owner': owner.toMap(),
      'location': location,
      'description': description,
      'type': type.toMap(),
      'goods': goods.map((x) => x.toMap()).toList(),
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      name: map['name'] as String,
      owner: Npc.fromMap(map['owner'] as Map<String, dynamic>),
      location: map['location'] as String,
      description: map['description'] as String,
      type: LocationType.values.firstWhere((element) =>
          element.toString() == "LocationType.${map["type"]["name"]}"),
      goods: List<Goods>.from(
        (map['goods']).map<Goods>(
          (x) => Goods.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Location(name: $name, owner: $owner, location: $location, description: $description, type: $type, goods: $goods)';
  }

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.owner == owner &&
        other.location == location &&
        other.description == description &&
        other.type == type &&
        listEquals(other.goods, goods);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        owner.hashCode ^
        location.hashCode ^
        description.hashCode ^
        type.hashCode ^
        goods.hashCode;
  }
}
