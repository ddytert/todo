package database

import (
	"database/sql"

	"github.com/ddytert/todo/internal/models"
)

type DBRepo interface {
	Connection() *sql.DB

	AllTasksForUser(userID int) ([]*models.Task, error)
	AllTasksForTaskList(taskListID int) ([]*models.Task, error)
	AllTaskListsForUser(userID int) ([]*models.TaskList, error)

	UserByID(userID int) (*models.User, error)
}
