//-----------------------------------Drow-----------------------------------
const drowNames1 = [
  "Alean",
  "Ale",
  "Arab",
  "Arken",
  "Auvry",
  "Baen",
  "Barri",
  "Cladd",
  "Desp",
  "De",
  "Do'",
  "Eils",
  "Everh",
  "Fre",
  "Gode",
  "Helvi",
  "Hla",
  "Hun'",
  "Ken",
  "Kil",
  "Mae",
  "Mel",
  "My",
  "Noqu",
  "Orly",
  "Ouss",
  "Rilyn",
  "Teken'",
  "Tor",
  "Zau",
];
const drowNames2 = [
  "afin",
  "ana",
  "ani",
  "ar",
  "arn",
  "ate",
  "ath",
  "duis",
  "ervs",
  "ep",
  "ett",
  "ghym",
  "iryn",
  "lyl",
  "mtor",
  "ndar",
  "neld",
  "rae",
  "rahel",
  "rret",
  "sek",
  "th",
  "tlar",
  "t'tar",
  "tyl",
  "und",
  "urden",
  "val",
  "viir",
  "zynge",
];
const drowNames3 = [
  "Ahly",
  "Akor",
  "Alau",
  "Aly",
  "Ama",
  "Anga",
  "Anlu",
  "Ardu",
  "Aun",
  "Ba",
  "Bal",
  "Bau",
  "Belar",
  "Bes",
  "Bri",
  "Brigan",
  "Bror",
  "Bur",
  "Byr",
  "Caz",
  "Cha",
  "Chad",
  "Chali",
  "Chan",
  "Char",
  "Chari",
  "Chen",
  "Ches",
  "Dhau",
  "Dilyn",
  "Dra",
  "Dri",
  "Eclav",
  "Eler",
  "Elv",
  "Elvan",
  "Era",
  "Erel",
  "Fae",
  "Felyn",
  "Fil",
  "G'el",
  "Gaus",
  "Ghi",
  "Gre",
  "Gu",
  "Hael",
  "Halis",
  "Ilha",
  "Ilivar",
  "Ilm",
  "Im",
  "Jael",
  "Jez",
  "Jha",
  "Jhael",
  "Jhan",
  "Jhu",
  "Kha",
  "Kia",
  "La",
  "Lae",
  "Lle",
  "Llol",
  "Lua",
  "Ly",
  "Ma",
  "Menzo",
  "Mez'Bar",
  "Micar",
  "Miz",
  "Miz'",
  "Myrym",
  "Na",
  "Narce",
  "Nedy",
  "Nen",
  "Ni",
  "Nul",
  "Olo",
  "Pella",
  "Phae",
  "Phyr",
  "Qi",
  "Quar",
  "Rau",
  "Ril",
  "Sab",
  "Sara",
  "Sas",
  "Sche",
  "Shi",
  "Shulvall",
  "Shur",
  "Shyn",
  "Sindyr",
  "Solen",
  "Ssap",
  "T'ris",
  "Ta",
  "Tala",
  "Tall",
  "Thal",
  "Thir",
  "Thrae",
  "Uli",
  "Ulvii",
  "Um",
  "Url",
  "Urme",
  "Vhon",
  "Vico",
  "Vier",
  "Vor",
  "Waer",
  "Wuyon",
  "Xa",
  "Xu",
  "Xull",
  "Yas",
  "Yvon",
  "Z'res",
  "Zar",
  "Zebe",
  "Zee",
  "Zel",
  "Zenda",
  "Zes",
  "Zil",
];
const drowNames4 = [
  "berra",
  "breena",
  "brina",
  "da",
  "dalyn",
  "dara",
  "dia",
  "diira",
  "dra",
  "dreza",
  "driia",
  "driira",
  "drith",
  "dryl",
  "faen",
  "faere",
  "gara",
  "ka",
  "lace",
  "lae",
  "laena",
  "lanna",
  "lass",
  "le",
  "lena",
  "lene",
  "less",
  "lia",
  "lica",
  "lice",
  "liira",
  "lin",
  "lindra",
  "lue",
  "lure",
  "lyrr",
  "lyth",
  "ma",
  "myra",
  "na",
  "nae",
  "nalla",
  "ne",
  "nel",
  "nia",
  "nida",
  "nirra",
  "niss",
  "nistra",
  "passa",
  "ra",
  "rae",
  "raema",
  "raenil",
  "rala",
  "ran",
  "re",
  "rena",
  "rene",
  "ress",
  "ri",
  "riel",
  "riina",
  "rina",
  "ris",
  "rith",
  "ryl",
  "ryn",
  "ryna",
  "rynda",
  "rynna",
  "saaria",
  "sandra",
  "shalee",
  "sinil",
  "sintra",
  "sra",
  "ste",
  "stin",
  "stra",
  "stree",
  "syne",
  "tana",
  "tha",
  "thra",
  "thrae",
  "thrana",
  "tlara",
  "tree",
  "tyn",
  "tyna",
  "va",
  "vra",
  "ya",
  "yana",
  "yanna",
  "za",
  "zalle",
  "zana",
  "zara",
  "zina",
  "zira",
  "zrima",
  "zrym",
];
const drowNames5 = [
  "Adin",
  "Alak",
  "Alton",
  "Amal",
  "Ant",
  "Bar",
  "Bel",
  "Berg",
  "Bhin",
  "Bruh",
  "Cal",
  "Chasz",
  "Din",
  "Dip",
  "Div",
  "Driz",
  "Duag",
  "Dur",
  "Elaug",
  "Elk",
  "Erth",
  "Fil",
  "Gel",
  "Go",
  "Gul",
  "Hatch",
  "Hurz",
  "Ilzt",
  "Im",
  "Ist",
  "Izz",
  "Jar",
  "Kalan",
  "Kel",
  "Kren",
  "Kron",
  "Les",
  "Llt",
  "Lyme",
  "Malag",
  "Mas",
  "Mer",
  "Mourn",
  "Nad",
  "Nal",
  "Nil",
  "Nym",
  "Omar",
  "Orgoll",
  "Phar",
  "Phyx",
  "Quev",
  "Quil",
  "Ran",
  "Relon",
  "Rhyl",
  "Rik",
  "Riz",
  "Ryl",
  "Ryld",
  "Selds",
  "Shar",
  "Sol",
  "Sorn",
  "Spir",
  "Ssz",
  "Szin",
  "Szor",
  "Tar",
  "Tath",
  "Taz",
  "Teb",
  "Tluth",
  "Tsab",
  "Uhls",
  "Url",
  "Val",
  "Vesz",
  "Vorn",
  "Vuz",
  "Wehl",
  "Welv",
  "Wod",
  "Wruz",
  "Yaz",
  "Zakn",
  "Zek",
  "Zsz",
];
const drowNames6 = [
  "afein",
  "agh",
  "aghar",
  "al",
  "antar",
  "aonar",
  "as",
  "atar",
  "atlab",
  "aufein",
  "aun",
  "axle",
  "d",
  "daer",
  "dan",
  "dar",
  "dax",
  "diin",
  "diirn",
  "dor",
  "dorl",
  "driirn",
  "drin",
  "dyn",
  "erd",
  "erin",
  "eth",
  "fein",
  "gloth",
  "gos",
  "hrae",
  "hriir",
  "hrys",
  "ica",
  "imar",
  "in",
  "inid",
  "inyon",
  "irahc",
  "kah",
  "launim",
  "lyn",
  "myr",
  "nar",
  "net",
  "nozz",
  "oj",
  "olg",
  "olil",
  "olvir",
  "omph",
  "onim",
  "or",
  "orvir",
  "oyn",
  "raen",
  "rak",
  "ral",
  "rar",
  "ree",
  "roos",
  "ryn",
  "rysn",
  "tar",
  "tel",
  "ton",
  "tran",
  "trin",
  "ven",
  "vyr",
  "yln",
  "yraen",
  "yrd",
  "zaer",
  "zar",
  "zen",
  "zt",
  "zyr",
];

//-----------------------------------Giant-----------------------------------
const giantNames1 = [
  "b",
  "c",
  "d",
  "f",
  "g",
  "h",
  "j",
  "k",
  "l",
  "m",
  "n",
  "r",
  "s",
  "t",
  "v",
  "w",
  "x",
  "z",
  "a",
  "b",
  "c",
  "d",
  "f",
  "g",
  "h",
  "j",
  "k",
  "l",
  "m",
  "n",
  "r",
  "s",
  "t",
  "v",
  "w",
  "x",
  "z",
  "ar",
  "br",
  "cr",
  "dr",
  "fr",
  "gr",
  "kr",
  "sr",
  "tr",
  "vr",
  "wr",
  "al",
  "bl",
  "cl",
  "dl",
  "fl",
  "gl",
  "kl",
  "sl",
  "vl",
  "zl",
  "",
  "",
  "",
  "",
  "",
];
const giantNames2 = ["e", "i", "u", "o", "a"];
const giantNames3 = [
  "b",
  "c",
  "d",
  "f",
  "g",
  "k",
  "l",
  "m",
  "n",
  "r",
  "s",
  "t",
  "w",
  "x",
  "z",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
];
const giantNames4 = [
  "ag",
  "am",
  "as",
  "bar",
  "barg",
  "bog",
  "bor",
  "bos",
  "brog",
  "der",
  "dhor",
  "dius",
  "dor",
  "dus",
  "fius",
  "fum",
  "fur",
  "gan",
  "gant",
  "gar",
  "gi",
  "gir",
  "grog",
  "kaos",
  "karos",
  "kos",
  "krus",
  "las",
  "lith",
  "log",
  "lor",
  "los",
  "malog",
  "mir",
  "mohr",
  "nar",
  "nas",
  "nir",
  "nus",
  "og",
  "om",
  "os",
  "rion",
  "roch",
  "rog",
  "rus",
  "rym",
  "sag",
  "sal",
  "sar",
  "sius",
  "sog",
  "sor",
  "tag",
  "tius",
  "theus",
  "thor",
  "thos",
  "to",
  "tor",
  "vag",
  "ver",
  "var",
  "vir",
  "vog",
  "war",
  "wor",
  "zar",
  "ziar",
  "zus",
];

//-----------------------------------Yuan-Ti-----------------------------------
const yuanTiNames1 = [
  "",
  "",
  "",
  "",
  "",
  "h",
  "m",
  "n",
  "s",
  "sh",
  "ss",
  "ssh",
  "sz",
  "t",
  "th",
  "y",
  "z",
  "zh",
  "zs",
];
const yuanTiNames2 = [
  "a",
  "e",
  "i",
  "o",
  "u",
  "a",
  "e",
  "i",
  "o",
  "u",
  "a",
  "e",
  "i",
  "o",
  "u",
  "a",
  "e",
  "i",
  "o",
  "u",
  "a",
  "e",
  "i",
  "o",
  "u",
  "oa",
  "ui",
];
const yuanTiNames3 = [
  "h",
  "hl",
  "htl",
  "hl",
  "hs",
  "hsh",
  "k",
  "kh",
  "kl",
  "ktl",
  "ks",
  "l",
  "lk",
  "ls",
  "ltl",
  "lts",
  "lsh",
  "m",
  "n",
  "s",
  "sh",
  "ss",
  "st",
  "stl",
  "sz",
  "sk",
  "t",
  "tl",
  "ts",
  "tsh",
  "tsz",
  "tz",
  "tstl",
  "zs",
  "zh",
  "zsh",
  "zt",
  "ztl",
];
const yuanTiNames5 = [
  "a",
  "i",
  "u",
  "a",
  "i",
  "u",
  "a",
  "i",
  "u",
  "a",
  "i",
  "u",
  "a",
  "i",
  "u",
  "a",
  "i",
  "u",
  "ie",
  "ia",
  "ei",
  "ee",
  "iu",
  "ui",
];
const yuanTiNames6 = [
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "h",
  "h",
  "l",
  "ll",
  "s",
  "ss",
  "sh",
];
