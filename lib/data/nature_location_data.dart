//-----------------------------------Type-----------------------------------
enum NatureLocationType { coast, desert, forest, mountain, sea, swamp }

//-----------------------------------Direction-----------------------------------
const natureLocationDirection = [
  "north",
  "south",
  "east",
  "west",
  "middle",
  "northwest",
  "northwest",
  "southwest",
  "southeast",
];

//-----------------------------------Known For-----------------------------------
const natureLocationKnown = [
  "people who enter but never leave",
  "its diverse wildlife",
  "its diverse vegetation",
  "its lack of wildlife",
  "an important event that took place in it",
  "an horrible event that took place in it",
  "an important person who live in it",
  "its abundance of resources",
  "unusual activities",
  "an hideout of a guild or a cult"
];

//-----------------------------------Weather-----------------------------------
const coastWeather = [
  "is warm all year long",
  "is warm only in the summer",
  "is rainy most of the time",
  "is sunny most of the time",
  "has unpredictable weather",
  "suffers from occasional tidal waves"
];
const desertWeather = [
  "is hot all day long",
  "has regular sandstorms",
  "is extremely hot during the day but extremely cold during the night",
  "has no shadow to be found",
  "has strong winds",
  "have many floods during the winter"
];
const forestWeather = [
  "is cold all year long",
  "is warm all year long",
  "has a mild weather",
  "suffers from occasional fires during the summer",
  "is rainy most of the year",
  "is foggy",
];
const mountainWeather = [
  "is snowy all year long",
  "is warm during the summer",
  "suffers from occasional avalanches",
  "is never snowy",
  "is snowy only in the winter",
  "has unpredictable weather"
];
const seaWeather = [
  "is quiet most of the time",
  "is stormy most of the year",
  "has occasional storms",
  "has unpredictable weather",
  "is rainy most of the time",
  "is extremely cold during the night"
];
const swampWeather = [
  "is humid",
  "is warm all year long",
  "is extremely rainy",
  "suffers from rare acidic rain",
  "is especially fusty",
  "has a damp weather"
];
const natureLocationWeather = {
  NatureLocationType.coast: coastWeather,
  NatureLocationType.desert: desertWeather,
  NatureLocationType.forest: forestWeather,
  NatureLocationType.mountain: mountainWeather,
  NatureLocationType.sea: seaWeather,
  NatureLocationType.swamp: swampWeather,
};

//-----------------------------------Made From-----------------------------------
const coastMadeFrom = [
  "has soft white sand",
  "has rocky terrain",
  "has many palm trees",
  "is covered by short vegetation",
  "is surrounded by tall cliffs",
  "has soft yellow sand"
];
const desertMadeFrom = [
  "has countless dunes",
  "has several oases sparsed all over it",
  "has a rocky terrain",
  "has scarce vegetation",
  "has numerous cacti growing in it",
  "has colored sand",
];
const forestMadeFrom = [
  "has exceptionally tall trees",
  "is covered by moss",
  "is shadowed by the trees",
  "has trees with twisted trunks",
  "has small streams of water",
  "has leafless trees",
];
const mountainMadeFrom = [
  "is an active volcano",
  "is made out of a black stone",
  "is made out a gray stone",
  "has a number of peaks",
  "is covered by short vegetation",
  "is a dormant volcano"
];
const seaMadeFrom = [
  "has light blue water",
  "has almost transparent water",
  "has rocky islands sparsed all over it",
  "has dark blue, almost black water",
  "is rich in sea foam",
  "has bubbles rising from the bottom"
];
const swampMadeFrom = [
  "has vines growing everywhere",
  "has trees with exceptionally twisted trunks",
  "has many fireflies",
  "has black water",
  "has a mysterious fog",
  "has weird flowers growing along the water"
];
const natureLocationMadeFrom = {
  NatureLocationType.coast: coastMadeFrom,
  NatureLocationType.desert: desertMadeFrom,
  NatureLocationType.forest: forestMadeFrom,
  NatureLocationType.mountain: mountainMadeFrom,
  NatureLocationType.sea: seaMadeFrom,
  NatureLocationType.swamp: swampMadeFrom,
};

//-----------------------------------Size-----------------------------------
const coastSize = [
  "is one of the largest coasts in the continent",
  "is one of the smallest coasts in the continent",
  "is long but narrow"
      "is not small nor large",
  "is large and wide",
  "is small"
];
const desertSize = [
  "is one of the largest deserts in the continent",
  "is one of the smallest deserts in the continent",
  "is as wide as it is long",
  "stretches across a large area",
  "is small",
  "is in the shape of a circle",
];
const forestSize = [
  "is one of the largest forests in the continent",
  "is one of the smallest forests in the continent",
  "has an undefined shape",
  "is large",
  "is small",
  "is rectangular",
];
const mountainSize = [
  "is one of tha tallest mountains in the continent",
  "reaches the clouds",
  "is not especially tall",
  "is wide",
  "is tall",
  "is twice as tall as it is wide"
];
const seaSize = [
  "is one of the largest seas in the continent",
  "is small",
  "covers a large area",
  "is surrounded by land",
  "has an undefined shape",
  "is almost as large as an ocean"
];
const swampSize = [
  "is one of the largest swamps in the continent",
  "is one of the smallest swamps in the continent",
  "has an undefined shape",
  "is large",
  "is small",
  "is in the shape of a circle",
];
const natureLocationSize = {
  NatureLocationType.coast: coastSize,
  NatureLocationType.desert: desertSize,
  NatureLocationType.forest: forestSize,
  NatureLocationType.mountain: mountainSize,
  NatureLocationType.sea: seaSize,
  NatureLocationType.swamp: swampSize,
};

//-----------------------------------Travel Rate-----------------------------------
const natureTravelRate = [
  "never"
      "sporadically",
  "occasionally",
  "intermittently",
  "frequently",
  "constantly"
];

//-----------------------------------Resources-----------------------------------
const coastResources = ["fish", "pearls", "salt", ""];
const desertResources = ["glass", "gold", "silver", "gems", "dyes"];
const forestResources = ["woods", "herbs", "fruits", "furs", "meat"];
const mountainResources = ["obsedian", "gold", "copper", "gems", "diamonds"];
const swampResources = [
  "woods",
  "herbs",
  "peat",
  "bog iron",
  "mushrooms",
  "dyes",
  "clay"
];
const natureResources = {
  NatureLocationType.coast: coastResources,
  NatureLocationType.desert: desertResources,
  NatureLocationType.forest: forestResources,
  NatureLocationType.mountain: mountainResources,
  NatureLocationType.sea: coastResources,
  NatureLocationType.swamp: swampResources,
};
