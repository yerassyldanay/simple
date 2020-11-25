package database

import (
	"context"
	"github.com/stretchr/testify/require"
	"simple/utils/randomer"
	"testing"
)

func createBoardTest(t *testing.T) (Board) {
	name := randomer.RandomString(20)

	board, err := testQueries.CreateBoard(context.Background(), name)
	require.NoError(t, err)

	require.Equal(t, board.Name, name)
	require.NotZero(t, board.ID)
	require.NotZero(t, board.CreatedAt)

	return board
}

func TestCreateBoard(t *testing.T) {
	_ = createBoardTest(t)
}

func TestUpdateString(t *testing.T) {

	// create one
	board := createBoardTest(t)

	// new info for update
	arg := UpdateBoardParams{
		Name: randomer.RandomString(20),
		ID: board.ID,
	}

	// update value
	newBoard, err := testQueries.UpdateBoard(context.Background(), arg)

	// check
	require.NoError(t, err)
	require.NotZero(t, newBoard.ID)
	require.NotEqual(t, newBoard.Name, board.Name)
	require.NotEqual(t, newBoard, board)
}

func TestDeleteBoard(t *testing.T) {
	board := createBoardTest(t)
	boardDeleted, err := testQueries.DeleteBoard(context.Background(), board.ID)

	// check
	require.NoError(t, err)
	require.Equal(t, board, boardDeleted)
}

func TestGetBoards(t *testing.T) {
	_ = createBoardTest(t)
	_ = createBoardTest(t)

	// get
	arg := ListBoardsParams{
		Limit:  10,
		Offset: 0,
	}
	boards, err := testQueries.ListBoards(context.Background(), arg)

	// check
	require.NoError(t, err)
	ok := len(boards) > 2
	require.Equal(t, ok, true)
}