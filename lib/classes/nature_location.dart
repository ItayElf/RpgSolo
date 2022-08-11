// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rpgsolo/data/nature_location_data.dart';
import 'package:rpgsolo/utils/extensions.dart';

class NatureLocation {
  final String name;
  final NatureLocationType type;
  final String direction;
  final String knownFor;
  final String weather;
  final String madeFrom;
  final String size;
  final String creature;
  final String travelRate;
  final String resource;

  NatureLocation({
    required this.name,
    required this.type,
    required this.direction,
    required this.knownFor,
    required this.weather,
    required this.madeFrom,
    required this.size,
    required this.creature,
    required this.travelRate,
    required this.resource,
  });

  NatureLocation copyWith({
    String? name,
    NatureLocationType? type,
    String? direction,
    String? knownFor,
    String? weather,
    String? madeFrom,
    String? size,
    String? creature,
    String? travelRate,
    String? resource,
  }) {
    return NatureLocation(
      name: name ?? this.name,
      type: type ?? this.type,
      direction: direction ?? this.direction,
      knownFor: knownFor ?? this.knownFor,
      weather: weather ?? this.weather,
      madeFrom: madeFrom ?? this.madeFrom,
      size: size ?? this.size,
      creature: creature ?? this.creature,
      travelRate: travelRate ?? this.travelRate,
      resource: resource ?? this.resource,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'type': type.toMap(),
      'direction': direction,
      'knownFor': knownFor,
      'weather': weather,
      'madeFrom': madeFrom,
      'size': size,
      'creature': creature,
      'travelRate': travelRate,
      'resource': resource,
    };
  }

  factory NatureLocation.fromMap(Map<String, dynamic> map) {
    return NatureLocation(
      name: map['name'] as String,
      type: NatureLocationType.values.firstWhere((element) =>
          element.toString() == "NatureLocationType.${map["type"]["name"]}"),
      direction: map['direction'] as String,
      knownFor: map['knownFor'] as String,
      weather: map['weather'] as String,
      madeFrom: map['madeFrom'] as String,
      size: map['size'] as String,
      creature: map['creature'] as String,
      travelRate: map['travelRate'] as String,
      resource: map['resource'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NatureLocation.fromJson(String source) =>
      NatureLocation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NatureLocation(name: $name, type: $type, direction: $direction, knownFor: $knownFor, weather: $weather, madeFrom: $madeFrom, size: $size, creature: $creature, travelRate: $travelRate, resource: $resource)';
  }

  @override
  bool operator ==(covariant NatureLocation other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.type == type &&
        other.direction == direction &&
        other.knownFor == knownFor &&
        other.weather == weather &&
        other.madeFrom == madeFrom &&
        other.size == size &&
        other.creature == creature &&
        other.travelRate == travelRate &&
        other.resource == resource;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        type.hashCode ^
        direction.hashCode ^
        knownFor.hashCode ^
        weather.hashCode ^
        madeFrom.hashCode ^
        size.hashCode ^
        creature.hashCode ^
        travelRate.hashCode ^
        resource.hashCode;
  }
}
