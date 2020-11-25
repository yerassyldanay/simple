CREATE TABLE "boards" (
  "id" BIGSERIAL PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL,
  "created_at" timestamptz DEFAULT 'now()'
);

CREATE TABLE "columns" (
  "id" BIGSERIAL PRIMARY KEY,
  "board_id" bigint NOT NULL,
  "name" varchar NOT NULL,
  "order" int NOT NULL DEFAULT 0,
  "archived" timestamptz DEFAULT null
);

CREATE TABLE "items" (
  "id" BIGSERIAL PRIMARY KEY,
  "column_id" bigint NOT NULL,
  "name" varchar NOT NULL,
  "done" timestamptz
);

CREATE TABLE "tasks" (
  "id" BIGSERIAL PRIMARY KEY,
  "item_id" bigint NOT NULL,
  "name" varchar NOT NULL,
  "done" timestamptz DEFAULT null
);

ALTER TABLE "columns" ADD FOREIGN KEY ("board_id") REFERENCES "boards" ("id");

ALTER TABLE "items" ADD FOREIGN KEY ("column_id") REFERENCES "columns" ("id");

ALTER TABLE "tasks" ADD FOREIGN KEY ("item_id") REFERENCES "items" ("id");

CREATE INDEX ON "columns" ("board_id");

CREATE INDEX ON "items" ("column_id");

CREATE INDEX ON "tasks" ("item_id");

COMMENT ON COLUMN "columns"."order" IS 'this is how items will be arranged';
