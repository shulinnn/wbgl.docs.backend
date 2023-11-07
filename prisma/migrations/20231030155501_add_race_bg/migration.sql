/*
  Warnings:

  - Added the required column `race_background` to the `Race` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Race" ADD COLUMN     "race_background" TEXT NOT NULL;
