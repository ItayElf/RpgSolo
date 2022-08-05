enum Race {
  dragonborn,
  dwarf,
  elf,
  gnome,
  goblin,
  goliath,
  halfling,
  halfElf,
  halfOrc,
  human,
  tiefling,
}

extension RaceExtention on Race {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name};
  }

  Race fromString(String name) {
    return Race.values
        .firstWhere((element) => element.toString() == "Race.$name");
  }
}
