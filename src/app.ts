import express, { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
const app = express();
const port = process.env.PORT || 3000;
app.use(express.static("public"));

/// Get ALL Races
app.get("/races", async (req: Request, res: Response) => {
  const races = await prisma.race.findMany({
    select: {
      race_icon: true,
      race_name: true,
      race_background: true,
      RaceSpell: {
        select: {
          spell_name: true,
          spell_icon: true,
          spell_description: true,
        },
      },
    },
  });

  res.json(races);
});

app.get("/race/:race_name", async (req: Request, res: Response) => {
  const race = await prisma.race.findFirst({
    select: {
      id: true,
      race_icon: true,
      race_name: true,
      RaceSpell: {
        select: {
          id: true,
          spell_name: true,
          spell_icon: true,
          spell_description: true,
        },
      },
    },
    where: {
      race_name: req.params.race_name,
    },
  });
  res.json(race);
});
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
