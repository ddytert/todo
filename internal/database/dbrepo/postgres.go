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

func (m *postgresDBRepo) AllTodosForUser(userID int) ([]*models.Todo, error) {

	ctx, cancel := context.WithTimeout(context.Background(), dbTimeout)
	defer cancel()

	query := `
		select
			id, todo_list_id, user_id,
			title, content, state_id,
			priority_id, due_date,
			created_at, updated_at
		from
			todos
		where user_id = $1
	`

	rows, err := m.DB.QueryContext(ctx, query, userID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var todos []*models.Todo

	for rows.Next() {
		var t models.Todo
		err := rows.Scan(
			&t.ID,
			&t.TodoListID,
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
		todos = append(todos, &t)
	}

	return todos, nil
}

func (m *postgresDBRepo) AllTodosForTodoList(todoListID int) ([]*models.Todo, error) {

	ctx, cancel := context.WithTimeout(context.Background(), dbTimeout)
	defer cancel()

	query := `
		select
			id, todo_list_id, user_id,
			title, content, done,
			state_id, priority_id, due_date,
			created_at, updated_at
		from
			todos
		where todo_list_id = $1
	`

	rows, err := m.DB.QueryContext(ctx, query, todoListID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var todos []*models.Todo

	for rows.Next() {
		var t models.Todo
		err := rows.Scan(
			&t.ID,
			&t.TodoListID,
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
		todos = append(todos, &t)
	}

	return todos, nil
}

func (m *postgresDBRepo) AllTodoListsForUser(userID int) ([]*models.TodoList, error) {
	ctx, cancel := context.WithTimeout(context.Background(), dbTimeout)
	defer cancel()

	query := `
	select
		id, user_id,
		name, description, state_id,
		priority_id, due_date,
		created_at, updated_at
	from
		todo_lists
	where user_id = $1
`
	rows, err := m.DB.QueryContext(ctx, query, userID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var todoLists []*models.TodoList

	for rows.Next() {
		var tl models.TodoList
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
		// tl.todos = []*models.Todo{}
		todoLists = append(todoLists, &tl)
	}

	return todoLists, nil
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
