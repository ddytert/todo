package dbrepo

import (
	"context"
	"database/sql"
	"time"

	"github.com/ddytert/todo/internal/models"
)

const dbTimeout = time.Second * 3

func (m *postgresDBRepo) Connection() *sql.DB {
	return m.DB
}

func (m *postgresDBRepo) AllTasksForUser(userID int) ([]*models.Task, error) {

	ctx, cancel := context.WithTimeout(context.Background(), dbTimeout)
	defer cancel()

	query := `
		select
			id, task_list_id, user_id,
			title, content, state_id,
			priority_id, due_date,
			created_at, updated_at
		from
			tasks
		where user_id = $1
	`

	rows, err := m.DB.QueryContext(ctx, query, userID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var tasks []*models.Task

	for rows.Next() {
		var t models.Task
		err := rows.Scan(
			&t.ID,
			&t.TaskListID,
			&t.UserID,
			&t.Title,
			&t.Content,
			&t.StateID,
			&t.PriorityID,
			&t.DueDate,
			&t.CreatedAt,
			&t.UpdatedAt,
		)
		if err != nil {
			return nil, err
		}
		tasks = append(tasks, &t)
	}

	return tasks, nil
}
