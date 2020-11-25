package api

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

type createBoardParams struct {
	Name			string 				`json:"name"`
}

func (server *Server) createBoard(ctx *gin.Context) {
	var arg createBoardParams
	if err := ctx.ShouldBindJSON(&arg); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err.Error()))
		return
	}

	board, err := server.query.CreateBoard(ctx, arg.Name)
	if err != nil {
		errorResponse(err.Error())
	}

	ctx.JSON(http.StatusOK, board)
}
