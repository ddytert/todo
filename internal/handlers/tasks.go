package handlers

import (
	"net/http"
	"strconv"

	"github.com/ddytert/todo/internal/utils"
	"github.com/go-chi/chi/v5"
)

func (m *Repository) GetAllTasksForUser(w http.ResponseWriter, r *http.Request) {
	id := chi.URLParam(r, "id")
	userID, err := strconv.Atoi(id)
	if err != nil {
		utils.ErrorJSON(w, err)
		return
	}

	tasks, err := m.DB.AllTasksForUser(userID)
	if err != nil {
		utils.ErrorJSON(w, err)
		return
	}

	_ = utils.WriteJSON(w, http.StatusOK, tasks)
}

func (m *Repository) GetAllTasksForTaskList(w http.ResponseWriter, r *http.Request) {
	id := chi.URLParam(r, "id")
	taskListID, err := strconv.Atoi(id)
	if err != nil {
		utils.ErrorJSON(w, err)
		return
	}

	tasks, err := m.DB.AllTasksForTaskList(taskListID)
	if err != nil {
		utils.ErrorJSON(w, err)
		return
	}

	_ = utils.WriteJSON(w, http.StatusOK, tasks)
}
