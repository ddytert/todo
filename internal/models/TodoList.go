package models

import "time"

type TodoList struct {
	ID          int        `json:"id"`
	Todos       []*Todo    `json:"todos"`
	UserID      int        `json:"user_id"`
	Name        string     `json:"name"`
	Description string     `json:"description"`
	Done        bool       `json:"done"`
	StateID     int        `json:"state_id"`
	PriorityID  int        `json:"priority_id"`
	DueDate     *time.Time `json:"due_date"`
	CreatedAt   time.Time  `json:"-"`
	UpdatedAt   time.Time  `json:"-"`
}
