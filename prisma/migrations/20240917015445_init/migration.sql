-- CreateTable
CREATE TABLE "shareholder" (
    "id" BIGSERIAL NOT NULL,
    "stock_code" VARCHAR,
    "stock_name" VARCHAR,
    "rank" SMALLINT,
    "radio" REAL,
    "amount" DOUBLE PRECISION,
    "date" DATE,
    "is_deleted" BOOLEAN,
    "update_at" TIMESTAMPTZ(6) DEFAULT (now() AT TIME ZONE 'utc'::text),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "shareholder_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "shareholder_stock_code_date_is_deleted_key" ON "shareholder"("stock_code", "date", "is_deleted");
