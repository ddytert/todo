package rest

import (
	"net/http"

	"github.com/ddytert/todo/internal/handler"
	"github.com/go-chi/chi/v5"
)

func GetRouter() http.Handler {
	//  create a router mux
	mux := chi.NewRouter()

	// Gerneral
	mux.Get("/health", handler.Repo.HealthCheck)

	// Tasks
	mux.Get("/tasks/user/{id}", handler.Repo.GetAllTasksForUser)

	return mux
}
