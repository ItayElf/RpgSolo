//-----------------------------------Quirks-----------------------------------
import 'package:rpgsolo/data/races.dart';

const duergarQuirks = [
  'always has a good ale at hand.',
  'feels ill at ease in open spaces.',
  'is more comfortable underground.',
  'frequently hums old dwarven songs.',
  'misses the world as it used to be.',
  'is strongly rooted within tradition.',
  'will take on any bet while drinking.',
  'is always covered in dirt.',
  'has almost never been above ground.',
  'doesn\'t feel comfortable when away from an axe.',
  'is always seen sharpening an axe.',
  'harbours a deep hatred of dwarves.',
  'has gemcutting as a hobby.'
];
const drowQuirks = [
  'is disgusted by human architecture.',
  'has a deep knowledge of ancient secrets.',
  'has a deep knowledge of ancient magic.',
  'will only speak common if absolutely forced to.',
  'paints stunning paintings in the spare time.',
  'occasionally uses terms from a different language while speaking.',
  'is followed by spiders.',
  "doesn't understand patriarchal society.",
  'feels more comfortable when away from the sun.',
  'knows all the best ways to torture someone.',
  'enjoys torturing small animals.',
];
//-----------------------------------Alignment-----------------------------------
const villainEthicalAlignment = {
  VillainRace.orc: [-3, -3, 3],
  VillainRace.drow: [-3, 3, -3],
  VillainRace.halfDrow: [-3, 3, -3],
  VillainRace.duergar: [3, -3, -3],
  VillainRace.yuanTi: [-3, 3, -3],
};
const villainMoralAlignment = {
  VillainRace.orc: [-3, -3, 3],
  VillainRace.drow: [-3, -3, 3],
  VillainRace.halfDrow: [-3, 3, -3],
  VillainRace.duergar: [-3, -3, 3],
  VillainRace.giant: [-3, 3, 3],
  VillainRace.yuanTi: [-3, -3, 3],
};
