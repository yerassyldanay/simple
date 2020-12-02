-- name: CreateBoardUserRelation :one
insert into board_responsible_users (board_id, user_id, authority_level)
values ($1, $2, $3) returning *;

-- name: GetUsersByBoardId :many
select u.fio, u.email, u.phone, u.code from users u
inner join board_responsible_users bru on u.id = bru.user_id
where bru.board_id = $1 order by fio limit $2 offset $3;

-- name: GetBoardsByUserId :many
select * from boards b inner join board_responsible_users bru on b.id = bru.board_id
where bru.user_id = $1 order by b.created_at limit $2 offset $3;
