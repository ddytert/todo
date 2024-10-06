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

func (m *postgresDBRepo) AllTasksForTaskList(taskListID int) ([]*models.Task, error) {

	ctx, cancel := context.WithTimeout(context.Background(), dbTimeout)
	defer cancel()

	query := `
		select
			id, task_list_id, user_id,
			title, content, done,
			state_id, priority_id, due_date,
			created_at, updated_at
		from
			tasks
		where task_list_id = $1
	`

	rows, err := m.DB.QueryContext(ctx, query, taskListID)
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
			&t.Done,
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

func (m *postgresDBRepo) AllTaskListsForUser(userID int) ([]*models.TaskList, error) {
	ctx, cancel := context.WithTimeout(context.Background(), dbTimeout)
	defer cancel()

	query := `
	select
		id, user_id,
		name, description, state_id,
		priority_id, due_date,
		created_at, updated_at
	from
		task_lists
	where user_id = $1
`
	rows, err := m.DB.QueryContext(ctx, query, userID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var taskLists []*models.TaskList

	for rows.Next() {
		var tl models.TaskList
		err := rows.Scan(
			&tl.ID,
			&tl.UserID,
			&tl.Name,
			&tl.Description,
			&tl.StateID,
			&tl.PriorityID,
			&tl.DueDate,
			&tl.CreatedAt,
			&tl.UpdatedAt,
		)
		if err != nil {
			return nil, err
		}
		// tl.Tasks = []*models.Task{}
		taskLists = append(taskLists, &tl)
	}

	return taskLists, nil
}

// ToDo: Remove, since it doesn't make sense
func (m *postgresDBRepo) UserByID(userID int) (*models.User, error) {
	ctx, cancel := context.WithTimeout(context.Background(), dbTimeout)
	defer cancel()

	query := `
		select
			id, first_name, last_name, email,
			access_level_id, created_at, updated_at
		from
			users
		where id = $1
	`

	row := m.DB.QueryRowContext(ctx, query, userID)

	var user models.User

	err := row.Scan(
		&user.ID,
		&user.FirstName,
		&user.LastName,
		&user.Email,
		&user.AccessLevelID,
		&user.CreatedAt,
		&user.UpdatedAt,
	)

	if err != nil {
		return nil, err
	}

	return &user, nil
}
