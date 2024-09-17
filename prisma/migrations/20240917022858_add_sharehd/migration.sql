/*
  Warnings:

  - You are about to drop the column `amount` on the `shareholder` table. All the data in the column will be lost.
  - You are about to drop the column `radio` on the `shareholder` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "shareholder" DROP COLUMN "amount",
DROP COLUMN "radio",
ADD COLUMN     "sahredh_type" VARCHAR,
ADD COLUMN     "sharehd_amount" DOUBLE PRECISION,
ADD COLUMN     "sharehd_name" VARCHAR,
ADD COLUMN     "sharehd_radio" REAL,
ADD COLUMN     "type" VARCHAR;
