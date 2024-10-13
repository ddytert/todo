package database

import (
	"database/sql"

	"github.com/ddytert/todo/internal/models"
)

type DBRepo interface {
	Connection() *sql.DB

	AllTodosForUser(userID int) ([]*models.Todo, error)
	AllTodosForTodoList(todoListID int) ([]*models.Todo, error)
	AllTodoListsForUser(userID int) ([]*models.TodoList, error)

	UserByID(userID int) (*models.User, error)
}
