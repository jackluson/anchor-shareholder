/*
  Warnings:

  - A unique constraint covering the columns `[stock_code,date,rank,is_deleted]` on the table `shareholder` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "shareholder_stock_code_date_is_deleted_key";

-- AlterTable
ALTER TABLE "shareholder" ADD COLUMN     "change_amount" DOUBLE PRECISION,
ADD COLUMN     "change_radio" DOUBLE PRECISION;

-- CreateIndex
CREATE UNIQUE INDEX "shareholder_stock_code_date_rank_is_deleted_key" ON "shareholder"("stock_code", "date", "rank", "is_deleted");
