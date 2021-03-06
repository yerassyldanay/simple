// Code generated by sqlc. DO NOT EDIT.

package database

import (
	"context"
)

type Querier interface {
	CreateBoard(ctx context.Context, name string) (Board, error)
	CreateBoardUserRelation(ctx context.Context, arg CreateBoardUserRelationParams) (BoardResponsibleUser, error)
	CreateUser(ctx context.Context, arg CreateUserParams) (User, error)
	DeleteBoard(ctx context.Context, id int64) (Board, error)
	DeleteUserById(ctx context.Context, id int64) (User, error)
	DeleteUserByUsername(ctx context.Context, username string) (User, error)
	GetAllUsers(ctx context.Context, arg GetAllUsersParams) ([]User, error)
	GetBoardsByUserId(ctx context.Context, arg GetBoardsByUserIdParams) ([]GetBoardsByUserIdRow, error)
	GetUserById(ctx context.Context, id int64) (User, error)
	GetUserByUsername(ctx context.Context, username string) (User, error)
	GetUsersByBoardId(ctx context.Context, arg GetUsersByBoardIdParams) ([]GetUsersByBoardIdRow, error)
	ListBoards(ctx context.Context, arg ListBoardsParams) ([]Board, error)
	UpdateBoard(ctx context.Context, arg UpdateBoardParams) (Board, error)
	UpdateUserInfoById(ctx context.Context, arg UpdateUserInfoByIdParams) (User, error)
	UpdateUserPasswordById(ctx context.Context, password string) (User, error)
}

var _ Querier = (*Queries)(nil)
