// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rpgsolo/utils/extensions.dart';

enum ActionResult { victory, draw, defeat }

class VillainAction {
  final String type;
  final String actionDescription;
  final ActionResult result;
  final String resultDescription;
  VillainAction({
    required this.type,
    required this.actionDescription,
    required this.result,
    required this.resultDescription,
  });

  VillainAction copyWith({
    String? type,
    String? actionDescription,
    ActionResult? result,
    String? resultDescription,
  }) {
    return VillainAction(
      type: type ?? this.type,
      actionDescription: actionDescription ?? this.actionDescription,
      result: result ?? this.result,
      resultDescription: resultDescription ?? this.resultDescription,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'actionDescription': actionDescription,
      'result': result.toMap(),
      'resultDescription': resultDescription,
    };
  }

  factory VillainAction.fromMap(Map<String, dynamic> map) {
    return VillainAction(
      type: map['type'] as String,
      actionDescription: map['actionDescription'] as String,
      result: ActionResult.values.firstWhere((element) =>
          element.toString() == "ActionResult.${map["result"]["name"]}"),
      resultDescription: map['resultDescription'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VillainAction.fromJson(String source) =>
      VillainAction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VillainAction(type: $type, actionDescription: $actionDescription, result: $result, resultDescription: $resultDescription)';
  }

  @override
  bool operator ==(covariant VillainAction other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.actionDescription == actionDescription &&
        other.result == result &&
        other.resultDescription == resultDescription;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        actionDescription.hashCode ^
        result.hashCode ^
        resultDescription.hashCode;
  }
}
