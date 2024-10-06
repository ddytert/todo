package models

import "time"

type TaskList struct {
	ID          int        `json:"id"`
	Tasks       []*Task    `json:"todos"`
	UserID      int        `json:"user_id"`
	Name        string     `json:"name"`
	Description string     `json:"description"`
	StateID     int        `json:"state_id"`
	PriorityID  int        `json:"priority_id"`
	DueDate     *time.Time `json:"due_date"`
	CreatedAt   time.Time  `json:"-"`
	UpdatedAt   time.Time  `json:"-"`
}
