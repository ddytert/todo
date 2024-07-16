package handler

import (
	"github.com/ddytert/todo/internal/database"
	"github.com/ddytert/todo/internal/database/dbrepo"
	"github.com/ddytert/todo/internal/driver"
)

// Repository is the repository type
type Repository struct {
	DB  database.DBRepo
}

// Repo is the repository used by the handlers
var Repo *Repository

// NewRepo creates a new repository
func NewRepo(db *driver.DB) *Repository {
	return &Repository{
		DB:  dbrepo.NewPostgresRepo(db.SQL),
	}
}

// NewHandlers sets the repository for the handlers
func NewHandlers(r *Repository) {
	Repo = r
}