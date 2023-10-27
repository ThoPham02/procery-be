CREATE TABLE IF NOT EXISTS "account_tbl" (
    "id" BIGINT PRIMARY KEY,
    "username" VARCHAR(255) NOT NULL,
    "hash_password" VARCHAR(255) NOT NULL,
    "role" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255),
    "phone" VARCHAR(20),
    "avata_url" VARCHAR(255),
    "birthday" VARCHAR(255)
)