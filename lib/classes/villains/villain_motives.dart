// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VillainMotives {
  final String goal;
  final String motivation;
  final String flaw;
  final String weakness;
  final String friends;
  final String allies;
  final String special;
  VillainMotives({
    required this.goal,
    required this.motivation,
    required this.flaw,
    required this.weakness,
    required this.friends,
    required this.allies,
    required this.special,
  });

  VillainMotives copyWith({
    String? goal,
    String? motivation,
    String? flaw,
    String? weakness,
    String? friends,
    String? allies,
    String? special,
  }) {
    return VillainMotives(
      goal: goal ?? this.goal,
      motivation: motivation ?? this.motivation,
      flaw: flaw ?? this.flaw,
      weakness: weakness ?? this.weakness,
      friends: friends ?? this.friends,
      allies: allies ?? this.allies,
      special: special ?? this.special,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'goal': goal,
      'motivation': motivation,
      'flaw': flaw,
      'weakness': weakness,
      'friends': friends,
      'allies': allies,
      'special': special,
    };
  }

  factory VillainMotives.fromMap(Map<String, dynamic> map) {
    return VillainMotives(
      goal: map['goal'] as String,
      motivation: map['motivation'] as String,
      flaw: map['flaw'] as String,
      weakness: map['weakness'] as String,
      friends: map['friends'] as String,
      allies: map['allies'] as String,
      special: map['special'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VillainMotives.fromJson(String source) =>
      VillainMotives.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VillainMotives(goal: $goal, motivation: $motivation, flaw: $flaw, weakness: $weakness, friends: $friends, allies: $allies, special: $special)';
  }

  @override
  bool operator ==(covariant VillainMotives other) {
    if (identical(this, other)) return true;

    return other.goal == goal &&
        other.motivation == motivation &&
        other.flaw == flaw &&
        other.weakness == weakness &&
        other.friends == friends &&
        other.allies == allies &&
        other.special == special;
  }

  @override
  int get hashCode {
    return goal.hashCode ^
        motivation.hashCode ^
        flaw.hashCode ^
        weakness.hashCode ^
        friends.hashCode ^
        allies.hashCode ^
        special.hashCode;
  }
}
