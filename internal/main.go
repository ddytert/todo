package main

import (
	"github.com/ddytert/todo/internal/app"
	"github.com/ddytert/todo/internal/config"
)

func main() {
	// Load configuration
	config := config.GetConfig()

	// Initialize the application
	app.Initialize(config)
}
