package handlers

import (
	"net/http"
	"strconv"

	"github.com/ddytert/todo/internal/utils"
	"github.com/go-chi/chi/v5"
)

func (m *Repository) GetAllTodosForUser(w http.ResponseWriter, r *http.Request) {
	id := chi.URLParam(r, "id")
	userID, err := strconv.Atoi(id)
	if err != nil {
		utils.ErrorJSON(w, err)
		return
	}

	todos, err := m.DB.AllTodosForUser(userID)
	if err != nil {
		utils.ErrorJSON(w, err)
		return
	}

	if len(todos) == 0 {
		utils.ClientError(w, 404)
		return
	}

	_ = utils.WriteJSON(w, http.StatusOK, todos)
}

func (m *Repository) GetTodossForTodoList(w http.ResponseWriter, r *http.Request) {
	id := chi.URLParam(r, "id")
	todoListID, err := strconv.Atoi(id)
	if err != nil {
		utils.ErrorJSON(w, err)
		return
	}

	todos, err := m.DB.AllTodosForTodoList(todoListID)
	if err != nil {
		utils.ErrorJSON(w, err)
		return
	}

	if len(todos) == 0 {
		utils.ClientError(w, 404)
		return
	}

	_ = utils.WriteJSON(w, http.StatusOK, todos)
}

func (m *Repository) GetTodoListsForUser(w http.ResponseWriter, r *http.Request) {
	id := chi.URLParam(r, "id")
	userID, err := strconv.Atoi(id)
	if err != nil {
		utils.ErrorJSON(w, err)
		return
	}

	todoLists, err := m.DB.AllTodoListsForUser(userID)
	if err != nil {
		utils.ErrorJSON(w, err)
		return
	}

	if len(todoLists) == 0 {
		utils.ClientError(w, 404)
		return
	}

	for _, tl := range todoLists {
		todos, err := m.DB.AllTodosForTodoList(tl.ID)
		if err != nil {
			utils.ErrorJSON(w, err)
			return
		}
		if len(todos) == 0 {
			utils.ClientError(w, 404)
			return
		}
		tl.Todos = todos
	}

	_ = utils.WriteJSON(w, http.StatusOK, todoLists)
}
