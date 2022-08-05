import 'package:flutter/material.dart';
import 'package:rpgsolo/data/races.dart';

extension StringExtension on String {
  String toTitleCase() {
    title(s) => "${s[0].toUpperCase()}${s.substring(1).toLowerCase()}";
    return split(" ").map(title).join(" ");
  }
}

extension RaceExtention on Race {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name};
  }

  String get printedName => name == "halfElf"
      ? "half-elf"
      : name == "halfOrc"
          ? "half-orc"
          : name;

  Race fromString(String name) {
    return Race.values
        .firstWhere((element) => element.toString() == "Race.$name");
  }
}

class SlideRoute extends MaterialPageRoute {
  SlideRoute({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
          .animate(animation),
      child: child,
    );
  }
}
