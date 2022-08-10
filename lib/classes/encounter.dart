// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rpgsolo/data/nature_location_data.dart';
import 'package:rpgsolo/utils/extensions.dart';

class Encounter {
  final NatureLocationType locationType;
  final String encounter;
  final String description;
  final String benefit;
  Encounter({
    required this.locationType,
    required this.encounter,
    required this.description,
    required this.benefit,
  });

  String get titleName {
    if (description == "") {
      return "Situation";
    } else if (encounter.startsWith("a ")) {
      return encounter.replaceFirst("a ", "");
    } else if (encounter.startsWith("an ")) {
      return encounter.replaceFirst("an ", "");
    }
    return encounter;
  }

  Encounter copyWith({
    NatureLocationType? locationType,
    String? encounter,
    String? description,
    String? benefit,
  }) {
    return Encounter(
      locationType: locationType ?? this.locationType,
      encounter: encounter ?? this.encounter,
      description: description ?? this.description,
      benefit: benefit ?? this.benefit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'locationType': locationType.toMap(),
      'encounter': encounter,
      'description': description,
      'benefit': benefit,
    };
  }

  factory Encounter.fromMap(Map<String, dynamic> map) {
    return Encounter(
      locationType: NatureLocationType.values.firstWhere((element) =>
          element.toString() ==
          "NatureLocationType.${map["locationType"]["name"]}"),
      encounter: map['encounter'] as String,
      description: map['description'] as String,
      benefit: map['benefit'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Encounter.fromJson(String source) =>
      Encounter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Encounter(locationType: $locationType, encounter: $encounter, description: $description, benefit: $benefit)';
  }

  @override
  bool operator ==(covariant Encounter other) {
    if (identical(this, other)) return true;

    return other.locationType == locationType &&
        other.encounter == encounter &&
        other.description == description &&
        other.benefit == benefit;
  }

  @override
  int get hashCode {
    return locationType.hashCode ^
        encounter.hashCode ^
        description.hashCode ^
        benefit.hashCode;
  }
}
