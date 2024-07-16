package database

import (
	"database/sql"

	"github.com/ddytert/todo/internal/models"
)

type DBRepo interface {
	Connection() *sql.DB

	AllTasksForUser(int) ([]*models.Task, error)
}
