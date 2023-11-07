-- CreateEnum
CREATE TYPE "AttackType" AS ENUM ('Melee', 'AntiAir');

-- CreateEnum
CREATE TYPE "MapType" AS ENUM ('M1', 'M2', 'M3', 'M4');

-- CreateTable
CREATE TABLE "Race" (
    "id" SERIAL NOT NULL,
    "race_name" TEXT NOT NULL,
    "race_icon" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Race_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RaceSpell" (
    "id" SERIAL NOT NULL,
    "spell_name" TEXT NOT NULL,
    "spell_icon" TEXT NOT NULL,
    "spell_description" TEXT NOT NULL,
    "raceId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RaceSpell_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Hero" (
    "id" SERIAL NOT NULL,
    "hero_name" TEXT NOT NULL,
    "hero_icon" TEXT NOT NULL,
    "attack_type" "AttackType" NOT NULL,
    "hero_cost" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "raceId" INTEGER,

    CONSTRAINT "Hero_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FrequentlyAskedQuestion" (
    "id" SERIAL NOT NULL,
    "question_heading" TEXT NOT NULL,
    "question_description" TEXT NOT NULL,
    "question_answer" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FrequentlyAskedQuestion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HeroSpell" (
    "id" SERIAL NOT NULL,
    "spell_name" TEXT NOT NULL,
    "spell_icon" TEXT NOT NULL,
    "spell_description" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "heroId" INTEGER,

    CONSTRAINT "HeroSpell_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Map" (
    "id" SERIAL NOT NULL,
    "map_name" TEXT NOT NULL,
    "map_description" TEXT NOT NULL,
    "map_creator" TEXT NOT NULL,
    "map_image" TEXT NOT NULL,
    "map_type" "MapType" NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Map_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UnitSpell" (
    "id" SERIAL NOT NULL,
    "spell_name" TEXT NOT NULL,
    "spell_icon" TEXT NOT NULL,
    "spell_description" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "unitId" INTEGER,

    CONSTRAINT "UnitSpell_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Card" (
    "id" SERIAL NOT NULL,
    "card_name" TEXT NOT NULL,
    "card_icon" TEXT NOT NULL,
    "card_description" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Card_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Unit" (
    "id" SERIAL NOT NULL,
    "unit_name" TEXT NOT NULL,
    "unit_icon" TEXT NOT NULL,
    "unit_cost_gold" INTEGER NOT NULL,
    "unit_cost_wood" INTEGER NOT NULL,
    "unit_is_summon" BOOLEAN NOT NULL,
    "raceId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "buildingId" INTEGER,

    CONSTRAINT "Unit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Building" (
    "id" SERIAL NOT NULL,
    "building_name" TEXT NOT NULL,
    "building_description" TEXT NOT NULL,
    "building_cost_gold" INTEGER NOT NULL,
    "building_cost_wood" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "raceId" INTEGER,

    CONSTRAINT "Building_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "RaceSpell_raceId_key" ON "RaceSpell"("raceId");

-- CreateIndex
CREATE UNIQUE INDEX "Map_map_name_key" ON "Map"("map_name");

-- AddForeignKey
ALTER TABLE "RaceSpell" ADD CONSTRAINT "RaceSpell_raceId_fkey" FOREIGN KEY ("raceId") REFERENCES "Race"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Hero" ADD CONSTRAINT "Hero_raceId_fkey" FOREIGN KEY ("raceId") REFERENCES "Race"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HeroSpell" ADD CONSTRAINT "HeroSpell_heroId_fkey" FOREIGN KEY ("heroId") REFERENCES "Hero"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UnitSpell" ADD CONSTRAINT "UnitSpell_unitId_fkey" FOREIGN KEY ("unitId") REFERENCES "Unit"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Unit" ADD CONSTRAINT "Unit_raceId_fkey" FOREIGN KEY ("raceId") REFERENCES "Race"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Unit" ADD CONSTRAINT "Unit_buildingId_fkey" FOREIGN KEY ("buildingId") REFERENCES "Building"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Building" ADD CONSTRAINT "Building_raceId_fkey" FOREIGN KEY ("raceId") REFERENCES "Race"("id") ON DELETE SET NULL ON UPDATE CASCADE;
