BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "receipts" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint,
    "filePath" text NOT NULL,
    "metadataHash" text NOT NULL,
    "assetId" text,
    "ocrText" text,
    "documentType" text,
    "category" text,
    "merchantName" text,
    "senderName" text,
    "recipientName" text,
    "totalAmount" double precision,
    "currency" text,
    "transactionType" text,
    "transactionDate" timestamp without time zone,
    "processedAt" timestamp without time zone NOT NULL,
    "processingStatus" text NOT NULL
);

-- Indexes
CREATE INDEX "metadataHash_idx" ON "receipts" USING btree ("metadataHash");


--
-- MIGRATION VERSION FOR receipt_butler
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('receipt_butler', '20260130141741895', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260130141741895', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260109031533194', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260109031533194', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();


COMMIT;
