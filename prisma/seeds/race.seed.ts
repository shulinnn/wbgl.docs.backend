import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();
export default async function main() {
  /// create all races here...
  const human = await prisma.race.create({
    data: {
      race_name: "Human",
      race_icon: "race/icons/240px-Humanrace.png",
      race_background: "race/background/human_bg.jpg",
      RaceSpell: {
        create: {
          spell_name: "Dispell",
          spell_icon: "race/spells/BTNDispelMagic.webp",
          spell_description:
            "Ruší negativní efekty karet, schopnosti hrdinů a rasových schopností.",
        },
      },
    },
  });

  const elf = await prisma.race.create({
    data: {
      race_name: "Night Elf",
      race_icon: "race/icons/240px-Nelfrace.png",
      race_background: "race/background/nightelf_bg.jpg",
      RaceSpell: {
        create: {
          spell_icon: "race/spells/BTNUproot.webp",
          spell_name: "Unroot",
          spell_description:
            "Dovolí nočním elfům vykořenit jakoukoliv budovu , ztrácí 1/2 svých životů a získává + 1 pohyb a +1 útok",
        },
      },
    },
  });

  const orc = await prisma.race.create({
    data: {
      race_name: "Orc",
      race_icon: "race/icons/240px-Orcrace.png",
      race_background: "race/background/orc_bg.jpg",
      RaceSpell: {
        create: {
          spell_description:
            "Vybraný hrdina získá netranitelnost a netečnost vůči magii na 3 kola.",
          spell_name: "Undying Rage",
          spell_icon: "race/spells/barrier.jpg",
        },
      },
    },
  });

  const undead = await prisma.race.create({
    data: {
      race_name: "Undead",
      race_icon: "race/icons/240px-Undeadrace.png",
      race_background: "race/background/undead_bg.jpg",
      RaceSpell: {
        create: {
          spell_description:
            "Hráč si může zničit vlastní hlavní budovu a získá 2 zlata a 2 dřeva.",
          spell_name: "Sacrifice",
          spell_icon: "race/spells/BTNSacrificialPit.webp",
        },
      },
    },
  });

  console.log({ human, orc, elf, undead });
}
