-- name: CreateUser :one
INSERT INTO users (fio, username, password, email, phone, code, created)
VALUES ($1, $2, $3, $4, $5, $6, $7 ) returning *;

-- name: GetUserById :one
SELECT * FROM users WHERE id = $1 LIMIT 1;

-- name: GetUserByUsername :one
SELECT * FROM users WHERE username = $1 LIMIT 1;

-- name: GetAllUsers :many
SELECT * FROM users LIMIT $1 OFFSET $2;

-- name: UpdateUserInfoById :one
UPDATE users set email = $1, code = $2, phone = $3, fio = $4 where id = $5 returning *;

-- name: UpdateUserPasswordById :one
UPDATE users set password = $1 where id = $1 returning *;

-- name: DeleteUserById :one
DELETE FROM users where id = $1 returning *;

-- name: DeleteUserByUsername :one
DELETE FROM users WHERE username = $1 returning *;
