package api

import (
	"github.com/gin-gonic/gin"
	db "simple/model/sqlc"
)

type Server struct {
	query		db.Querier
	router		*gin.Engine
}

func NewServer(query db.Querier) *Server {
	server := &Server{
		query: query,
	}
	router := gin.Default()

	router.POST("/board", server.createBoard)

	server.router = router
	return server
}

func (server *Server) Start(address string) error {
	return server.router.Run(address)
}

func errorResponse(errmsg string) gin.H {
	return gin.H { "error": errmsg }
}