/*
  Warnings:

  - You are about to drop the column `change_radio` on the `shareholder` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "shareholder" DROP COLUMN "change_radio",
ADD COLUMN     "change_ratio" DOUBLE PRECISION;
