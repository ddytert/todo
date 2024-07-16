package handlers

import (
	"log"
	"net/http"

	"github.com/ddytert/todo/internal/utils"
)

func (m *Repository) HealthCheck(w http.ResponseWriter, r *http.Request) {

	log.Println("Getting health state...")

	var payload = struct {
		HealthState string `json:"health_state"`
		Message     string `json:"message"`
	}{
		"OK",
		"Hello World!",
	}

	utils.WriteJSON(w, http.StatusOK, payload)
}