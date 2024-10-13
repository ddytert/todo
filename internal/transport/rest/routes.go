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

	// Todos
	mux.Get("/todos/user/{id}", handlers.Repo.GetAllTodosForUser)
	mux.Get("/todoList/{id}", handlers.Repo.GetTodossForTodoList)
	mux.Get("/todoLists/user/{id}", handlers.Repo.GetTodoListsForUser)

	// Users
	mux.Get("/users/{id}", handlers.Repo.GetUserById)
	return mux
}
