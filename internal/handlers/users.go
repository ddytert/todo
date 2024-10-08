package handlers

import (
	"net/http"
	"strconv"

	"github.com/ddytert/todo/internal/utils"
	"github.com/go-chi/chi/v5"
)

// Todo: Remove due to security risk
func (m *Repository) GetUserById(w http.ResponseWriter, r *http.Request) {
	id := chi.URLParam(r, "id")
	userID, err := strconv.Atoi(id)
	if err != nil {
		utils.ErrorJSON(w, err)
		return
	}

	user, err := m.DB.UserByID(userID)
	if err != nil {
		utils.ErrorJSON(w, err)
		return
	}

	if user == nil {
		utils.ClientError(w, 404)
		return
	}

	_ = utils.WriteJSON(w, http.StatusOK, user)
}