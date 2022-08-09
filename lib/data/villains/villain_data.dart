//-----------------------------------Power-----------------------------------
import 'package:rpgsolo/data/races.dart';

enum VillainPower { nuisance, local, regional, national, archvillain }

//-----------------------------------Class-----------------------------------
const villainClasses = [
  "artificer",
  "barbarian",
  "bard",
  "cleric",
  "druid",
  "fighter",
  "monk",
  "mystic",
  "paladin",
  "ranger",
  "rogue",
  "sorcerer",
  "warlock",
  "wizard",
];

//-----------------------------------Age-----------------------------------
const villainMaxAge = {
  VillainRace.orc: 50,
  VillainRace.drow: 750,
  VillainRace.duergar: 360,
  VillainRace.giant: 4000,
  VillainRace.yuanTi: 120
};

//-----------------------------------Actions-----------------------------------
const villainActions = {
  VillainPower.nuisance: 1,
  VillainPower.local: 2,
  VillainPower.regional: 3,
  VillainPower.national: 4,
  VillainPower.archvillain: 5
};
