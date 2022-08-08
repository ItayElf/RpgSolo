const actionDataObject = {
  "Dark Rituals": {
    "desc": ["NAME seeks to gain new powers and favors through a dark ritual"],
    "onVictory": [
      "NAME performs the ritual in a beneficial way. Entities from beyond grant a strength but also a characteristic mutation"
    ],
    "onDraw": [
      "The ritual is performed as planned but the result has not been as expected, causing an unholy change in NAME"
    ],
    "onDefeat": [
      "NAME loses control of the ritual causing an entity to mark REL body and provoking a weakness"
    ]
  },
  "Encounter with death": {
    "desc": [
      "NAME encounters death on REL way due to illness, enemy attack, accident or supernatural causes"
    ],
    "onVictory": [
      "NAME manages to barely avoid death thanks to the favor of another villain. Now PRON will have to return the favor, offering them economic power",
      "NAME manages to barely avoid death thanks to the favor of another villain. Now PRON will have to return the favor, providing them with food",
      "NAME manages to barely avoid death thanks to the favor of another villain. Now PRON will have to return the favor, bringing them back to life (since this villain is undead)",
      "NAME manages to barely avoid death thanks to the favor of another villain. Now PRON will have to return the favor, rescuing them from prison",
      "NAME manages to barely avoid death thanks to the favor of another villain. Now PRON will have to return the favor, rescuing their minions from prison",
      "NAME manages to barely avoid death thanks to the favor of another villain. Now PRON will have to return the favor, providing them with slaves",
      "NAME manages to barely avoid death thanks to the favor of another villain. Now PRON will have to return the favor, summoning them from another plane of existence",
      "NAME manages to barely avoid death thanks to the favor of another villain. Now PRON will have to return the favor, bringing their minions back to life",
      "NAME manages to barely avoid death thanks to the favor of another villain. Now PRON will have to return the favor, offering them something that increases their personal capabilities",
      "NAME manages to barely avoid death thanks to the favor of another villain. Now PRON will have to return the favor, taking political power on their behalf",
      "NAME manages to barely avoid death thanks to the favor of another villain. Now PRON will have to return the favor, offering them something that increases their personal capabilities"
    ],
    "onDraw": ["PRON manages to avoid death by a stroke of luck."],
    "onDefeat": [
      "NAME dies. However, this is not the end of the story, as years later PRON is resurrected by a spell",
      "NAME dies. However, this is not the end of the story, as years later PRON is summoned to the earthly world to be the slave of a superior villain",
      "NAME dies. However, this is not the end of the story, as years later PRON is resurrected by divine design",
      "NAME dies. However, this is not the end of the story, as years later PRON is brought back from the dead by a dark priest",
      "NAME has REL soul captured inside an automaton golem",
      "NAME dies. However, this is not the end of the story, as years later REL soul escapes from the underworld and possesses a person",
      "NAME dies. However, this is not the end of the story, as years later a necromancer recomposes REL soul and resurrects him",
      "NAME has REL mind linked to that of an admirer by dark magic",
      "NAME dies. However, this is not the end of the story, as years later PRON is summoned to the earthly world by a lower level villain",
      "NAME dies. However, this is not the end of the story, as years later PRON rises from the grave as an undead",
      "NAME dies. However, this is not the end of the story, as years later PRON is reincarnated as another being",
      "NAME dies. However, this is not the end of the story, as years later REL soul is captured inside a henchman of another villain",
      "NAME dies. However, this is not the end of the story, as years later PRON has REL mind linked to that of an admirer by dark magic"
    ]
  },
  "Summoning soldiers": {
    "desc": [
      "NAME recruits allies for REL purposes, eliminating the leaders who stand in REL way."
    ],
    "onVictory": [
      "NAME has destroyed an enemy leader, keeping those subjects who have sworn allegiance to him.",
      "NAME has managed to destroy the enemy leader and steal REL treasures. After this, one of REL subjects fell in love.",
      "NAME has wiped out an enemy leader and all REL minions. The experience has given him new skills.",
      "NAME has overpowered enemy leaders, gaining new recruits and treasure."
    ],
    "onDraw": [
      "Defeating the enemy leader has not had the desired effect and nothing relevant has been achieved."
    ],
    "onDefeat": [
      "NAME has been defeated by the enemy leader. This has generated a weakness.",
      "NAME has not succeeded in destroying the enemy leader. Moreover, in REL purpose one of REL treasures of power was destroyed.",
      "NAME has failed and the enemy leader has been left with one of REL subjects."
    ]
  },
  "Lethal attack": {
    "desc": [
      "NAME is attacked by a far superior character who seeks REL destruction."
    ],
    "onVictory": [
      "NAME defeats REL enemy in single combat, showing off REL new skills and receiving great spoils."
    ],
    "onDraw": [
      "PRON managed to escape the confrontation alive, being a true survivor."
    ],
    "onDefeat": [
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to an abandoned mine under an icy mountain.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a series of dark, dank tunnels.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a series of lava tubes near an active volcano.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a stone labyrinth.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a labyrinth.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a series of unstable tunnels at great depth.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a ruined catacomb.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to an iron-walled storage vault.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a fortress built by water creatures.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a fortress.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a fortress built by an ancient military order.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a temple dedicated to a god of fire.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to an evil temple.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to an evil monastery.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a tomb.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a series of half-flooded tunnels in the depths of a glacier.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a maze of semi-solid clouds.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a series of flooded tunnels in the depths of the earth.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to an abandoned mine under a volcanic mountain.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a palace built by a fire elemental lord.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to an inescapable prison.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a sea cave.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a temple dedicated to an earth god.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a series of deep tunnels with a constant, howling wind.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a palace built by an efreet prince.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a volcanic cave.",
      "His enemy defeated him, giving him up for dead and ordering REL body to be taken to a temple dedicated to a wind god."
    ]
  },
  "Promotion": {
    "desc": ["NAME confronts a superior villain and takes REL place."],
    "onVictory": [
      "NAME has emerged victorious from the confrontation, gaining a treasure and new followers.",
      "NAME has outmaneuvered REL enemy, gaining experience in the confrontation and honing REL skills.",
      "NAME has achieved REL goal, also obtaining an object of power to REL enemy.",
      "NAME has gained a new strength."
    ],
    "onDraw": [
      "The challenge has not had the desired effect and nothing relevant has been achieved."
    ],
    "onDefeat": [
      "NAME has taken a beating for REL betrayal.",
      "NAME has failed and no one took REL betrayal seriously. PRON has lost subjects because of it"
    ]
  },
  "New dungeon": {
    "desc": [
      "NAME seeks to build a new home where PRON can take refuge when necessary"
    ],
    "onVictory": [
      "NAME gets to conquer an elven-built ruin. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a mine. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a palace built by a winter elf queen. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a palace built by a fire elemental lord. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a series of flooded tunnels in the depths of the earth. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer an abandoned mine under a volcanic mountain. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a tomb. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a series of lava tubes near an active volcano. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a volcanic mountain. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer an inescapable prison. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a sea cave. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a series of half-flooded tunnels in the depths of a glacier. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a stone labyrinth. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a fortress built by an ancient military order. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a temple dedicated to an aquatic god. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a palace. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a palace built by an earth elemental lord. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a series of unstable tunnels at great depth. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a temple dedicated to a winter god. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer an iron fortress built by an ancient military order. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a series of dark, dank tunnels. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a temple dedicated to a wind god. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a series of deep tunnels with a constant, howling wind. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a series of caves in a floating speck of earth. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a series of interconnected earthy burrows. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a labyrinth of tall hedges. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer an iron-walled storage vault. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a labyrinth of solid rock. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a fortress built by aquatic beings. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a storage vault. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a mining operation gone wrong. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a labyrinth. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a temple dedicated to a fire god. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer an evil temple. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a maze of semi-solid clouds. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a prison. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a temple dedicated to an earth god. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a ruined catacomb. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a temple. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a fortress built by elemental earth beings. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a series of geothermal vents in the subsoil. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a sewer. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a palace built by an air elemental lord. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a lair. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a palace built by an efreet prince. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer an evil monastery. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a palace built by a water elemental lord. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a series of coal-black tunnels. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer an icy cave. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a fortress built by water creatures. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a black rock maze. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a fortress built by elemental air beings. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a temple dedicated to a god of fire. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a spooky cave. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a mystical cave. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a fortress built by fire beings. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a fortress. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a volcanic cave. REL new subjects keep the place of unwanted guests. ",
      "NAME gets to conquer a forgotten tomb. REL new subjects keep the place of unwanted guests. "
    ],
    "onDraw": [
      "PRON hasn't found any interesting places in the immediate vicinity."
    ],
    "onDefeat": [
      "PRON has been expelled from a sewer when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from an iron-walled storage vault when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a lair when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a maze of semi-solid clouds when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a temple dedicated to an aquatic god when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a spooky cave when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a temple dedicated to a fire god when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a mine when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a huge forge or armory that has gone awry when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from an abandoned mine under an icy mountain when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a fortress built by elemental earth beings when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a series of flooded tunnels in the depths of the earth when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a stone labyrinth when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a sea cave when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from an elven-built ruin when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a palace built by an air elemental lord when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a palace built by a fire elemental lord when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a ruined catacomb when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a temple dedicated to an earth god when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a series of interconnected earthy burrows when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a black rock maze when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a temple when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a series of caves in a floating speck of earth when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a series of geothermal vents in the subsoil when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a fortress built by aquatic beings when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a series of lava tubes near an active volcano when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a labyrinth of tall hedges when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a forgotten tomb when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from an icy cave when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a labyrinth when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a palace when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a mystical cave when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a sewer that has gone bad when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a fortress when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from an evil temple when tried to conquer. This has caused him to show weakness",
      "PRON has been expelled from a series of coal-black tunnels when tried to conquer. This has caused him to show weakness"
    ]
  },
  "Initiation": {
    "desc": [
      "NAME is joined by another villain to help him. When the time comes, PRON will betray them."
    ],
    "onVictory": [
      "NAME has managed to betray the enemy villain and obtain an items of power.",
      "NAME has gained a new strength.",
      "NAME has managed to betray REL enemy, gaining experience and new strengths.",
      "NAME has succeeded in humiliating the enemy villain and REL subjects have switched sides."
    ],
    "onDraw": [
      "The betrayal has not had the desired effect and nothing relevant has been achieved."
    ],
    "onDefeat": [
      "NAME has taken a beating for REL betrayal.",
      "NAME has failed and no one took REL betrayal seriously. PRON has lost subjects because of it"
    ]
  },
  "Death threat": {
    "desc": [
      "NAME poses a death threat to a low-level member of a guild",
      "NAME poses a death threat to a member of the clergy",
      "NAME poses a death threat to an apprentice cleric",
      "NAME poses a death threat to a constable ",
      "NAME poses a death threat to a servant of a lord",
      "NAME poses a death threat to a member of a noble house",
      "NAME poses a death threat to an apprentice blacksmith",
      "NAME poses a death threat to a wanderer",
      "NAME poses a death threat to a guild leader",
      "NAME poses a death threat to a merchant",
      "NAME poses a death threat to an apprentice craftsman",
      "NAME poses a death threat to a commoner",
      "NAME poses a death threat to a mayor",
      "NAME poses a death threat to an apprentice craftswoman",
      "NAME poses a death threat to an adventurer",
      "NAME poses a death threat to a traveler",
      "NAME poses a death threat to a member of a secret order",
      "NAME poses a death threat to a slave",
      "NAME poses a death threat to a scholar",
      "NAME poses a death threat to a mercenary",
      "NAME poses a death threat to a guard",
      "NAME poses a death threat to a mayoress"
    ],
    "onVictory": [
      "NAME has attracted the attention of a person who falls in love. Now PRON has a lover and has learned a new skill from this person.",
      "NAME has succeeded in making the threat take effect. Several henchmen join REL purpose.",
      "NAME has pushed REL threats to the limit, having to make use of REL skills, which have improved with practice.",
      "NAME has succeeded in making the threat take effect. Profits from extortion."
    ],
    "onDraw": [
      "The threats have not had the desired effect and nothing relevant has been achieved."
    ],
    "onDefeat": [
      "NAME has failed and no one took REL threats seriously. PRON has lost subjects because of it",
      "NAME has been beaten up for REL threats."
    ]
  },
  "Information gathering": {
    "desc": [
      "Collect as much data as possible on a religious traitor that keeps a secret.",
      "Collect as much data as possible on a religious event organizer that keeps a secret.",
      "Collect as much data as possible on a pirate sailor that keeps a secret.",
      "Collect as much data as possible on a satirical author that keeps a secret.",
      "Collect as much data as possible on a religious spy that keeps a secret.",
      "Collect as much data as possible on a escapee from a slave camp that keeps a secret.",
      "Collect as much data as possible on a convicted thief that keeps a secret.",
      "Collect as much data as possible on a noblewoman that keeps a secret.",
      "Collect as much data as possible on a man adorned with flowers that keeps a secret.",
      "Collect as much data as possible on a rich shoemaker that keeps a secret.",
      "Collect as much data as possible on a police  agent that keeps a secret.",
      "Collect as much data as possible on a underage princess that keeps a secret.",
      "Collect as much data as possible on a alliance researcher that keeps a secret.",
      "Collect as much data as possible on a debt-ridden bounty hunter that keeps a secret.",
      "Collect as much data as possible on a magic influencer that keeps a secret.",
      "Collect as much data as possible on a beggar with contacts that keeps a secret.",
      "Collect as much data as possible on a collector of animals that keeps a secret.",
      "Collect as much data as possible on a lessor of estates that keeps a secret.",
      "Collect as much data as possible on a peasant's anarcho-syndicalist that keeps a secret.",
      "Collect as much data as possible about a community.",
      "Collect as much data as possible on a plane traveler that keeps a secret.",
      "Collect as much data as possible on a spokeswoman for the king that keeps a secret.",
      "Collect as much data as possible on a merchant of vice goods that keeps a secret.",
      "Collect as much data as possible on a orchard owner that keeps a secret.",
      "Collect as much data as possible on a hunter of giant birds that keeps a secret.",
      "Collect as much data as possible on a demigod that keeps a secret.",
      "Collect as much data as possible on a sinister dentist that keeps a secret.",
      "Collect as much data as possible on a author of lewd books that keeps a secret.",
      "Collect as much data as possible on a beggar that keeps a secret.",
      "Collect as much data as possible on a collecting outsider that keeps a secret.",
      "Collect as much data as possible on a accused of murder that keeps a secret.",
      "Collect as much data as possible on a trainer of rare animals that keeps a secret.",
      "Collect as much data as possible about an enemy villain.",
      "Collect as much data as possible on a scholar of mathematics that keeps a secret.",
      "Collect as much data as possible on a mediocre shoemaker that keeps a secret.",
      "Collect as much data as possible on a deranged prophetess that keeps a secret.",
      "Collect as much data as possible about an ally's plans.",
      "Collect as much data as possible about personal matters.",
      "Collect as much data as possible on a rogue adventurer that keeps a secret.",
      "Collect as much information as possible about an influential person in the area.",
      "Collect as much data as possible on a architect of palaces that keeps a secret.",
      "Collect as much data as possible on an herbalist with secret knowledge that keeps a secret.",
      "Collect as much data as possible on a winemaker of exquisite wines that keeps a secret.",
      "Collect as much data as possible on a guild authority that keeps a secret.",
      "Collect as much data as possible on a sinister butcher that keeps a secret.",
      "Collect as much data as possible on an expert of illegal substances that keeps a secret.",
      "Collect as much data as possible on a princess threatened with death that keeps a secret.",
      "Collect as much data as possible on a defense lawyer that keeps a secret.",
      "Collect as much data as possible on a government investigator that keeps a secret.",
      "Collect as much data as possible on a corrupt legislator that keeps a secret.",
      "Collect as much data as possible about the next mission.",
      "Collect as much data as possible on an elixir seller that keeps a secret.",
      "Collect as much data as possible on a guard looking for a prisoner that keeps a secret."
    ],
    "onVictory": [
      "NAME has gained knowledge about what PRON was looking for, gaining a strength."
    ],
    "onDraw": ["No relevant information has been found."],
    "onDefeat": [
      "No relevant information has been obtained and the target has obtained relevant information on NAME, causing a weakness to be exposed."
    ]
  },
  "Execution": {
    "desc": ["NAME has captured some characters and is going to execute them."],
    "onVictory": [
      "NAME has executed REL prisoners, showing exemplary fortitude"
    ],
    "onDraw": ["The execution of the prisoners has not triggered any change."],
    "onDefeat": [
      "PRON has not been able to execute REL prisoners. (they fled, someone got in the way or was betrayed by an ally). This has caused a weakness to be exposed."
    ]
  },
  "Duel": {
    "desc": [
      "An enemy villain confronts NAME to take away REL followers and treasures"
    ],
    "onVictory": [
      "NAME has outperformed REL opponent, gaining experience in the confrontation and honing REL skills."
    ],
    "onDraw": [
      "The betrayal has not had the desired effect and nothing relevant has been achieved."
    ],
    "onDefeat": [
      "NAME has been beaten nearly to death and has acquired weaknesses",
      "NAME has been defeated and one of REL subjects has changed sides",
      "NAME has no choice but to give one of REL objects of power to avoid REL execution"
    ]
  },
  "Supernatural Encounter": {
    "desc": [
      "NAME is surprised by a supernatural power that surpasses REL powers in every aspect."
    ],
    "onVictory": [
      "NAME manages to stand up to power with firmness, demonstrating REL abilities"
    ],
    "onDraw": ["PRON managed to flee from power, keeping REL sanity intact."],
    "onDefeat": ["The power overcomes and causes NAME to lose REL sanity"]
  },
  "Interference": {
    "desc": [
      "NAME interferes in the mission of some adventurers by adding difficulties.",
      "NAME interferes with the mission of some adventurers by attempting to rob them.",
      "NAME interfer with another villain's mission by attacking them.",
      "NAME interferes in the mission of some adventurers by attacking them directly.",
      "NAME interferes with another villain's mission by hindering their plans.",
      "NAME interferes with another villain's mission by trying to steal from them."
    ],
    "onVictory": [
      "NAME has managed to steal an object that increases REL influence.",
      "NAME has succeeded in thwarting the plans of REL adversaries and has gained new subjects.",
      "NAME has managed to severely damage REL opponents and has gained experience."
    ],
    "onDraw": ["PRON has failed to interfere with REL target's plans."],
    "onDefeat": [
      "NAME flees from combat in the face of defeat, acquiring a weakness.",
      "NAME has lost one of REL objects in the mission.",
      "NAME has lost one of REL henchmen on the mission.",
      "NAME withdraws without achieving REL objective and acquires a weakness.",
      "NAME has left sequelae"
    ]
  },
  "Betrayal": {
    "desc": [
      "REL trusted henchman has betrayed NAME and seeks to keep everything for themselves."
    ],
    "onVictory": [
      "NAME has destroyed the traitor henchman, gaining experience and new skills acquired in combat",
      "NAME has destroyed REL traitor, keeping one of REL objects of power.",
      "NAME has outperformed REL opponent, gaining experience in the confrontation and honing REL skills."
    ],
    "onDraw": [
      "The betrayal has not had the desired effect and nothing relevant has been achieved."
    ],
    "onDefeat": [
      "NAME has been defeated by the treachery of REL henchman, who has kept REL treasures.",
      "NAME has been beaten to nearly death by REL ally and has acquired weaknesses",
      "NAME has been defeated by REL henchman, losing treasure and influence"
    ]
  },
  "Feast": {
    "desc": [
      "NAME celebrates a great feast in memory of a triumph or special event."
    ],
    "onVictory": [
      "NAME has gotten REL allies to arrive with gifts for the great feast."
    ],
    "onDraw": [
      "The feast has been given as expected and everyone leaves the place happy."
    ],
    "onDefeat": [
      "The feast has ended in complete failure. The allies leave in a huff and NAME acquires a weakness."
    ]
  },
  "Duel betrayal": {
    "desc": [
      "One of REL sons confronts NAME to keep REL followers and possessions.",
      "REL lover confronts NAME in order to keep REL followers and possessions."
    ],
    "onVictory": [
      "NAME has destroyed REL traitor, keeping one of REL objects of power.",
      "NAME has outperformed REL opponent, gaining experience in the confrontation and honing REL skills."
    ],
    "onDraw": [
      "The betrayal has not had the desired effect and nothing relevant has been achieved."
    ],
    "onDefeat": ["NAME has been defeated, losing treasure and influence"]
  },
  "Destroy a community": {
    "desc": [
      "NAME wishes to destroy a tribe of barbarians.",
      "NAME wishes to destroy a frontier town.",
      "NAME wishes to destroy a local region of civilizations.",
      "NAME wishes to destroy a coastal town.",
      "NAME wishes to destroy a military camp.",
      "NAME has killed a trained monster or mascot.",
      "NAME has control of money (a local treasurer or military quartermaster, perhaps) and is using people's debts to force them to perform REL evil actions.",
      "NAME wishes to destroy a metropolis.",
      "NAME wishes to destroy a barony.",
      "NAME wishes to destroy a city.",
      "NAME wishes to destroy an indigenous region (with necessary resources).",
      "NAME wishes to destroy a kingdom.",
      "NAME has a minion who is a feudal lord, crime boss, or holds some other position in which people make overt promises to NAME."
    ],
    "onVictory": [
      "NAME achieves REL goal, demonstrating REL skills once again"
    ],
    "onDraw": ["Although the plans go well, the outcome was not as expected."],
    "onDefeat": ["NAME fails to achieve REL objective, revealing a weakness"]
  },
  "Kills an important character": {
    "desc": [
      "NAME attempts to assasinate someone who has great influence to demonstrate REL power"
    ],
    "onVictory": [
      "NAME eliminates REL target, gaining loot and influence in the region."
    ],
    "onDraw": ["PRON fails to find the target after a long time."],
    "onDefeat": [
      "NAME is defeated and suffers significant after-effects of combat"
    ]
  },
  "Ambush": {
    "desc": ["NAME sets a trap for an enemy character."],
    "onVictory": [
      "NAME succeeds in REL ambush, defeating REL enemies and making off with the loot"
    ],
    "onDraw": [
      "The enemies managed to flee from the ambush after losing the confrontation"
    ],
    "onDefeat": [
      "The ambush results in failure, causing NAME to have to flee and showing weakness."
    ]
  },
  "Kill a beast": {
    "desc": ["NAME kills a beast to demonstrate REL power."],
    "onVictory": [
      "NAME defeats on REL own a hippogriff, gaining new minions",
      "NAME defeats on REL own a wyvern, gaining new minions",
      "NAME defeats on REL own a tree man, gaining new minions",
      "NAME defeats on REL own a goblin shaman, gaining new minions",
      "NAME defeats on REL own a giant, gaining new minions",
      "NAME defeats on REL own a lamia, gaining new minions",
      "NAME defeats on REL own a 12-headed hydra, gaining new minions",
      "NAME defeats on REL own a demigryph, gaining new minions",
      "NAME defeats on REL own a cyclop, gaining new minions",
      "NAME defeats on REL own a terrifying spider, gaining new minions",
      "NAME defeats on REL own a Pegasus, gaining new minions",
      "NAME defeats on REL own a zombie dragon, gaining new minions",
      "NAME defeats on REL own a winged snake, gaining new minions",
      "NAME defeats on REL own a jelly cube, gaining new minions",
      "NAME defeats on REL own a spider queen, gaining new minions",
      "NAME defeats on REL own a basilisk, gaining new minions",
      "NAME defeats on REL own a stone golem, gaining new minions",
      "NAME defeats on REL own a manticore, gaining new minions",
      "NAME defeats on REL own a wendigo, gaining new minions",
      "NAME defeats on REL own a troll, gaining new minions"
    ],
    "onDraw": ["PRON fails to find the beast after a long time."],
    "onDefeat": [
      "NAME is defeated by a goblin shaman, causing combat sequelae",
      "NAME is defeated by a stone golem, causing combat sequelae",
      "NAME is defeated by a winged snake, causing combat sequelae",
      "NAME is defeated by a wyvern, causing combat sequelae",
      "NAME is defeated by a spider queen, causing combat sequelae",
      "NAME is defeated by a 12-headed hydra, causing combat sequelae",
      "NAME is defeated by a manticore, causing combat sequelae",
      "NAME is defeated by a terrifying spider, causing combat sequelae",
      "NAME is defeated by a troll, causing combat sequelae",
      "NAME is defeated by a tree man, causing combat sequelae",
      "NAME is defeated by a Pegasus, causing combat sequelae",
      "NAME is defeated by a cyclop, causing combat sequelae",
      "NAME is defeated by a zombie dragon, causing combat sequelae",
      "NAME is defeated by a giant, causing combat sequelae",
      "NAME is defeated by a basilisk, causing combat sequelae",
      "NAME is defeated by a lamia, causing combat sequelae",
      "NAME is defeated by a hippogriff, causing combat sequelae",
      "NAME is defeated by a jelly cube, causing combat sequelae"
    ]
  },
  "Gain power": {
    "desc": ["NAME wishes to gain more influence, wealth or power."],
    "onVictory": [
      "NAME contains its objective, while acquiring new strengths and position."
    ],
    "onDraw": [
      "Although PRON achieves REL goal, the result does not provide anything relevant."
    ],
    "onDefeat": [
      "NAME loses power by failing in REL mission, revealing a weakness"
    ]
  },
  "Trial by ordeal": {
    "desc": [
      "Trial by combat of NAME against a subdite to solve a problem",
      "Trial by combat of NAME against an ally to solve a problem"
    ],
    "onVictory": [
      "NAME has won the trial, showing exemplary fortitude and displaying REL new skills."
    ],
    "onDraw": ["NAME won the trial but it hasn't made a difference."],
    "onDefeat": [
      "The trial went wrong and NAME was forced to flee at the last moment."
    ]
  },
  "Beast Hunt": {
    "desc": ["NAME goes on the hunt."],
    "onVictory": [
      "NAME manages to dominate a beast, which now obeys REL orders"
    ],
    "onDraw": ["NAME returned from the hunt with nothing in REL hands."],
    "onDefeat": [
      "A beast managed to defeat NAME, who had to flee showing weakness."
    ]
  },
  "Recruitment": {
    "desc": [
      "NAME seeks to increase REL strength, with new henchmen and allies."
    ],
    "onVictory": ["NAME has gained a new strength."],
    "onDraw": [
      "There is currently no one interested in enlisting in NAME's ranks."
    ],
    "onDefeat": [
      "No one wants to follow NAME. The recruitment attempt has resulted in a humiliation, which has created a weakness for NAME."
    ]
  }
};
