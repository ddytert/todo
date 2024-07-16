package app

import (
	"fmt"
	"log"
	"net/http"

	"github.com/ddytert/todo/internal/config"
	"github.com/ddytert/todo/internal/driver"
	"github.com/ddytert/todo/internal/handlers"
	"github.com/ddytert/todo/internal/transport/rest"
)

func Initialize(config *config.Config) {
	//nconnect to database
	db, err := driver.ConnectSQL(config.DB.DSN)
	if err != nil {
		log.Fatal("Cannot connect to database! Dying...")
	}
	defer db.SQL.Close()

	log.Println("Connected to database!")

	// setup handler repo
	repo := handlers.NewRepo(db)
	handlers.NewHandlers(repo)

	router := rest.GetRouter()

	log.Println("Starting application on port", config.Port)

	// start a web server
	err = http.ListenAndServe(fmt.Sprintf(":%d", config.Port), router)
	if err != nil {
		log.Fatal(err)
	}
}
