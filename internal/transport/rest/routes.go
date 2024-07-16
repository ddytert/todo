package rest

import (
	"net/http"

	"github.com/ddytert/todo/internal/handlers"
	"github.com/go-chi/chi/v5"
)

func GetRouter() http.Handler {
	//  create a router mux
	mux := chi.NewRouter()

	// Gerneral
	mux.Get("/health", handlers.Repo.HealthCheck)

	// Tasks
	mux.Get("/tasks/user/{id}", handlers.Repo.GetAllTasksForUser)

	return mux
}
