package models

import "time"

type Task struct {
	ID         int        `json:"id"`
	TaskListID int        `json:"task_list_id"`
	UserID     int        `json:"user_id"`
	Title      string     `json:"title"`
	Content    string     `json:"content"`
	Done       bool       `json:"done"`
	StateID    int        `json:"state_id"`
	PriorityID int        `json:"priority_id"`
	DueDate    *time.Time `json:"due_date"`
	CreatedAt  time.Time  `json:"-"`
	UpdatedAt  time.Time  `json:"-"`
}
