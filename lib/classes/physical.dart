// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Physical {
  final String hair;
  final String eyes;
  final String skin;
  final int height; // in cm
  final String build;
  final String face;
  final String special;
  final String? special2;
  Physical({
    required this.hair,
    required this.eyes,
    required this.skin,
    required this.height,
    required this.build,
    required this.face,
    required this.special,
    this.special2,
  });

  Physical copyWith({
    String? hair,
    String? eyes,
    String? skin,
    int? height,
    String? build,
    String? face,
    String? special,
    String? special2,
  }) {
    return Physical(
      hair: hair ?? this.hair,
      eyes: eyes ?? this.eyes,
      skin: skin ?? this.skin,
      height: height ?? this.height,
      build: build ?? this.build,
      face: face ?? this.face,
      special: special ?? this.special,
      special2: special2 ?? this.special2,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hair': hair,
      'eyes': eyes,
      'skin': skin,
      'height': height,
      'build': build,
      'face': face,
      'special': special,
      'special2': special2,
    };
  }

  factory Physical.fromMap(Map<String, dynamic> map) {
    return Physical(
      hair: map['hair'] as String,
      eyes: map['eyes'] as String,
      skin: map['skin'] as String,
      height: map['height'] as int,
      build: map['build'] as String,
      face: map['face'] as String,
      special: map['special'] as String,
      special2: map['special2'] != null ? map['special2'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Physical.fromJson(String source) =>
      Physical.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Physical(hair: $hair, eyes: $eyes, skin: $skin, height: $height, build: $build, face: $face, special: $special, special2: $special2)';
  }

  @override
  bool operator ==(covariant Physical other) {
    if (identical(this, other)) return true;

    return other.hair == hair &&
        other.eyes == eyes &&
        other.skin == skin &&
        other.height == height &&
        other.build == build &&
        other.face == face &&
        other.special == special &&
        other.special2 == special2;
  }

  @override
  int get hashCode {
    return hair.hashCode ^
        eyes.hashCode ^
        skin.hashCode ^
        height.hashCode ^
        build.hashCode ^
        face.hashCode ^
        special.hashCode ^
        special2.hashCode;
  }
}
