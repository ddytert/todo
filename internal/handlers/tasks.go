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

	if len(tasks) == 0 {
		utils.ClientError(w, 404)
		return
	}

	_ = utils.WriteJSON(w, http.StatusOK, tasks)
}

func (m *Repository) GetTasksForTaskList(w http.ResponseWriter, r *http.Request) {
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

	if len(tasks) == 0 {
		utils.ClientError(w, 404)
		return
	}

	_ = utils.WriteJSON(w, http.StatusOK, tasks)
}

func (m *Repository) GetTaskListsForUser(w http.ResponseWriter, r *http.Request) {
	id := chi.URLParam(r, "id")
	userID, err := strconv.Atoi(id)
	if err != nil {
		utils.ErrorJSON(w, err)
		return
	}

	taskLists, err := m.DB.AllTaskListsForUser(userID)
	if err != nil {
		utils.ErrorJSON(w, err)
		return
	}

	if len(taskLists) == 0 {
		utils.ClientError(w, 404)
		return
	}

	for _, tl := range taskLists {
		tasks, err := m.DB.AllTasksForTaskList(tl.ID)
		if err != nil {
			utils.ErrorJSON(w, err)
			return
		}
		if len(tasks) == 0 {
			utils.ClientError(w, 404)
			return
		}
		tl.Tasks = tasks
    }

	_ = utils.WriteJSON(w, http.StatusOK, taskLists)
}
