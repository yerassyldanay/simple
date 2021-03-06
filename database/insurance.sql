CREATE TABLE "boards" (
                          "id" bigserial PRIMARY KEY,
                          "name" varchar NOT NULL,
                          "created_at" timestamptz DEFAULT 'now()'
);

CREATE TABLE "groups" (
                          "id" bigserial PRIMARY KEY,
                          "board_id" bigserial NOT NULL,
                          "name" varchar NOT NULL,
                          "order" int NOT NULL DEFAULT 0,
                          "archived" timestamptz DEFAULT null
);

CREATE TABLE "tasks" (
                         "id" bigserial PRIMARY KEY,
                         "group_id" bigserial NOT NULL,
                         "name" varchar NOT NULL,
                         "done" timestamptz DEFAULT null
);

CREATE TABLE "users" (
                         "id" bigserial PRIMARY KEY,
                         "fio" varchar NOT NULL,
                         "username" varchar NOT NULL,
                         "password" varchar NOT NULL,
                         "email" varchar DEFAULT '',
                         "phone" varchar DEFAULT '',
                         "code" varchar DEFAULT '',
                         "created" timestamptz DEFAULT 'now()'
);

CREATE TABLE "phone_codes" (
                               "code" varchar PRIMARY KEY,
                               "country" varchar NOT NULL,
                               "continent" varchar DEFAULT ''
);

CREATE TABLE "board_responsible_users" (
                                           "board_id" bigserial,
                                           "user_id" bigserial,
                                           PRIMARY KEY ("board_id", "user_id")
);

CREATE TABLE "users_and_roles" (
                                   "user_id" bigserial,
                                   "role_id" bigserial,
                                   PRIMARY KEY ("user_id", "role_id")
);

CREATE TABLE "roles" (
                         "id" bigserial PRIMARY KEY,
                         "name" varchar UNIQUE NOT NULL
);

CREATE TABLE "roles_and_permissions" (
                                         "role_id" bigserial,
                                         "permission_id" bigserial,
                                         PRIMARY KEY ("role_id", "permission_id")
);

CREATE TABLE "permissions" (
                               "id" bigserial PRIMARY KEY,
                               "name" varchar NOT NULL,
                               "description" varchar NOT NULL
);

ALTER TABLE "groups" ADD FOREIGN KEY ("board_id") REFERENCES "boards" ("id");

ALTER TABLE "tasks" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("id");

ALTER TABLE "board_responsible_users" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "board_responsible_users" ADD FOREIGN KEY ("board_id") REFERENCES "boards" ("id");

ALTER TABLE "users_and_roles" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_and_roles" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "roles_and_permissions" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "roles_and_permissions" ADD FOREIGN KEY ("permission_id") REFERENCES "permissions" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("code") REFERENCES "phone_codes" ("code");

CREATE INDEX ON "groups" ("board_id");

CREATE INDEX ON "tasks" ("group_id");

COMMENT ON COLUMN "groups"."order" IS 'this is how items will be arranged';
