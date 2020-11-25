package database

import (
	_ "github.com/lib/pq"
	"database/sql"
	"log"
	"os"
	"testing"
)

var (
	dbName = "postgres"
	dbSource = "postgres://simple:simple@localhost:8001/simple?sslmode=disable"
)

var testQueries *Queries

func TestMain(m *testing.M) {
	connection, err := sql.Open(dbName, dbSource)
	if err != nil {
		// panic
		log.Fatal("could not connect to database. err: ", err)
	}

	testQueries = New(connection)

	os.Exit(m.Run())
}
