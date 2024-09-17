/*
  Warnings:

  - You are about to drop the column `sahredh_type` on the `shareholder` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "shareholder" DROP COLUMN "sahredh_type",
ADD COLUMN     "relation_type" VARCHAR,
ADD COLUMN     "sharedh_type" VARCHAR;
