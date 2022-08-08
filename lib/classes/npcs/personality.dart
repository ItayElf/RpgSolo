// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Personality {
  final String alignment;
  final String trait1;
  final String trait2;
  final String quirk1;
  final String quirk2;
  Personality({
    required this.alignment,
    required this.trait1,
    required this.trait2,
    required this.quirk1,
    required this.quirk2,
  });

  Personality copyWith({
    String? alignment,
    String? trait1,
    String? trait2,
    String? quirk1,
    String? quirk2,
  }) {
    return Personality(
      alignment: alignment ?? this.alignment,
      trait1: trait1 ?? this.trait1,
      trait2: trait2 ?? this.trait2,
      quirk1: quirk1 ?? this.quirk1,
      quirk2: quirk2 ?? this.quirk2,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'alignment': alignment,
      'trait1': trait1,
      'trait2': trait2,
      'quirk1': quirk1,
      'quirk2': quirk2,
    };
  }

  factory Personality.fromMap(Map<String, dynamic> map) {
    return Personality(
      alignment: map['alignment'] as String,
      trait1: map['trait1'] as String,
      trait2: map['trait2'] as String,
      quirk1: map['quirk1'] as String,
      quirk2: map['quirk2'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Personality.fromJson(String source) =>
      Personality.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Personality(alignment: $alignment, trait1: $trait1, trait2: $trait2, quirk1: $quirk1, quirk2: $quirk2)';
  }

  @override
  bool operator ==(covariant Personality other) {
    if (identical(this, other)) return true;

    return other.alignment == alignment &&
        other.trait1 == trait1 &&
        other.trait2 == trait2 &&
        other.quirk1 == quirk1 &&
        other.quirk2 == quirk2;
  }

  @override
  int get hashCode {
    return alignment.hashCode ^
        trait1.hashCode ^
        trait2.hashCode ^
        quirk1.hashCode ^
        quirk2.hashCode;
  }
}
