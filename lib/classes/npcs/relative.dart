// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Relative {
  final String name;
  final bool isMale;
  final String role; // father, mother, older sibiling etc.
  final String alignment;
  final String occupation;
  final String relationship;
  final String status;
  Relative({
    required this.name,
    required this.isMale,
    required this.role,
    required this.alignment,
    required this.occupation,
    required this.relationship,
    required this.status,
  });

  String get pronoun => isMale ? "he" : "she";
  String get relPronoun => isMale ? "his" : "her";
  String get firstName => name.split(" ")[0];

  Relative copyWith({
    String? name,
    bool? isMale,
    String? role,
    String? alignment,
    String? occupation,
    String? relationship,
    String? status,
  }) {
    return Relative(
      name: name ?? this.name,
      isMale: isMale ?? this.isMale,
      role: role ?? this.role,
      alignment: alignment ?? this.alignment,
      occupation: occupation ?? this.occupation,
      relationship: relationship ?? this.relationship,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'isMale': isMale,
      'role': role,
      'alignment': alignment,
      'occupation': occupation,
      'relationship': relationship,
      'status': status,
    };
  }

  factory Relative.fromMap(Map<String, dynamic> map) {
    return Relative(
      name: map['name'] as String,
      isMale: map['isMale'] as bool,
      role: map['role'] as String,
      alignment: map['alignment'] as String,
      occupation: map['occupation'] as String,
      relationship: map['relationship'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Relative.fromJson(String source) =>
      Relative.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Relative(name: $name, isMale: $isMale, role: $role, alignment: $alignment, occupation: $occupation, relationship: $relationship, status: $status)';
  }

  @override
  bool operator ==(covariant Relative other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.isMale == isMale &&
        other.role == role &&
        other.alignment == alignment &&
        other.occupation == occupation &&
        other.relationship == relationship &&
        other.status == status;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        isMale.hashCode ^
        role.hashCode ^
        alignment.hashCode ^
        occupation.hashCode ^
        relationship.hashCode ^
        status.hashCode;
  }
}
