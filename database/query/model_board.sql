-- name: CreateBoard :one
INSERT INTO boards (name) VALUES ($1) returning *;

-- name: ListBoards :many
SELECT * FROM boards ORDER BY created_at desc LIMIT $1 OFFSET $2;

-- name: UpdateBoard :one
UPDATE boards set name = $2 where id = $1 returning *;

-- name: DeleteBoard :one
DELETE FROM boards where id = $1 returning *;
