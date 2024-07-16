package dbrepo

import (
	"database/sql"
	"time"

	"github.com/ddytert/todo/internal/models"
)

//const dbTimeout = time.Second * 3

func (m *postgresDBRepo) Connection() *sql.DB {
	return m.DB
}

func (m *postgresDBRepo) AllTasksForUser(userID int) ([]*models.Task, error) {
	var tasks []*models.Task

	dueDate := time.Now().AddDate(0, 0, 3)

	tasks = append(tasks, &models.Task{
		ID:         1,
		TaskListID: 1,
		UserID:     1,
		Title:      "Take out the trash",
		Content:    "My least favorite task",
		StateID:    1,
		PriorityID: 1,
		DueDate:    dueDate,
		CreatedAt:  time.Now(),
		UpdatedAt:  time.Now(),
	})
	return tasks, nil
}
