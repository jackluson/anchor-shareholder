/*
  Warnings:

  - You are about to drop the column `sharedh_type` on the `shareholder` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "shareholder" DROP COLUMN "sharedh_type",
ADD COLUMN     "sharehd_type" VARCHAR;
