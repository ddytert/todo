package dbrepo

import (
	"database/sql"

	"github.com/ddytert/todo/internal/database"
)

type postgresDBRepo struct {
	DB *sql.DB
}


func NewPostgresRepo(conn *sql.DB) database.DBRepo {
	return &postgresDBRepo{
		DB: conn,
	}
}
