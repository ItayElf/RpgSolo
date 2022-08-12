//-----------------------------------Parents-----------------------------------
const halfElfParents = [
  "One parent was an elf and the other was a human",
  "One parent was an elf and the other was a human",
  "One parent was an elf and the other was a human",
  "One parent was an elf and the other was a human",
  "One parent was an elf and the other was a human",
  "One parent was an elf and the other was a half-elf",
  "One parent was a human and the other was a half-elf",
  "Both parents were half-elves",
];
const halfDrowParents = [
  "One parent was a drow and the other was a human",
  "One parent was a drow and the other was a human",
  "One parent was a drow and the other was a human",
  "One parent was a drow and the other was a human",
  "One parent was a drow and the other was a human",
  "One parent was a drow and the other was a half-drow",
  "One parent was a human and the other was a half-drow",
  "Both parents were half-drows",
];
const halfOrcParents = [
  "One parent was an orc and the other was a human",
  "One parent was an orc and the other was a human",
  "One parent was an orc and the other was a human",
  "One parent was an orc and the other was a half-orc",
  "One parent was an orc and the other was a half-orc",
  "One parent was a human and the other was a half-orc",
  "One parent was a human and the other was a half-orc",
  "Both parents were half-orcs",
];
const tieflingParents = [
  "Both parents were humans, their infernal heritage dormant until PRON came along",
  "Both parents were humans, their infernal heritage dormant until PRON came along",
  "Both parents were humans, their infernal heritage dormant until PRON came along",
  "Both parents were humans, their infernal heritage dormant until PRON came along",
  "One parent was a tiefling and the other was a human",
  "One parent was a tiefling and the other was a human",
  "One parent was a tiefling and the other was a devil",
  "One parent was a human and the other was a devil",
];

//-----------------------------------Birthplace-----------------------------------
const exoticBirthplace = [
  'in the home of a family friend',
  'in the home of a midwife',
  'in a wagon',
  'in a barn',
  'in a cave',
  'in a field',
  'in a forest',
  'in a temple',
  'in a battlefield',
  'in an alley',
  'in a tavern',
  'in a castle',
  'in a tower',
  'in a sewer',
  'among people of a different race',
  'on board a boat',
  'in a prison',
  'in the headquarters of a secret organization',
  "in a sage's laboratory",
  'in the feywild',
  'in the shadowfell'
];

//-----------------------------------Family-----------------------------------
const regularFamily = [
  "by a single father",
  "by a single mother",
  "by a mother and a father"
];
const exoticFamilty = [
  'on REL own',
  'by an institution',
  'by a temple',
  'by an orphanage',
  'by a guardian',
  'by REL aunt',
  'by REL uncle',
  'by REL ancle and aunt',
  'by REL grandparents',
  'by an adoptive family'
];
const absentParents = [
  "parents died",
  "parents were imprisoned",
  "parents were enslaved",
  "parents were taken away",
  "parents abandoned REL",
  "parent disappeared to an unknown fate",
];
const familyLifestyle = {
  "wretched": -40,
  "squalid": -20,
  "poor": -10,
  "modest": 0,
  "comfortable": 10,
  "wealthy": 20,
  "aristocratic": 40
};
const childhoodHome = {
  0: "on the streets",
  20: "in a rundown shack",
  30: "in no permanent residence",
  40: "in an encampment in the wilderness",
  50: "in an apartment inside a rundown neighborhood",
  70: "in a small house",
  90: "in a large house",
  110: "in a mansion",
  140: "in a palace",
};
const childhoodMemories = [
  'PRON is still haunted by REL childhood, when PRON was treated badly by REL peers',
  'PRON spent most of REL childhood alone, with no close friends',
  'PRON was seen by others as being different or strange, and so PRON had only a few companions',
  'PRON had a few close friends and lived an ordinary childhood',
  'PRON had several friends, and REL childhood was generally a happy one',
  'PRON always found it easy to make friends and loved being around people',
  'everyone knew who PRON was, and PRON had friends everywhere PRON went'
];

//-----------------------------------Relationship-----------------------------------
const relationshipStatus = [
  "hostile",
  "hostile",
  "friendly",
  "friendly",
  "friendly",
  "friendly",
  "friendly",
  "indiffrent",
  "indiffrent",
];
const relativeStatus = [
  'dead',
  'is missing',
  'is alive, but doing poorly due to an injury',
  'is alive, but doing poorly due to financial troubles',
  'is alive and well',
  'is alive and quite successful',
  'is alive and infamous',
  'is alive and famous'
];

//-----------------------------------Death-----------------------------------
const deathCause = [
  'BEVERB murdered',
  'BEVERB killed in battle',
  'had an accident related to REL occupation',
  'had an accident unrelated to REL occupation',
  'died because of natural causes',
  'committed suicide',
  'BEVERB torn apart by an animal',
  'BEVERB torn apart by a natural disaster',
  'BEVERB consumed by a monster',
  'BEVERB executed for a crime',
  'died in a bizarre event'
];
