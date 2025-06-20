package main

import (
	"log"
	"net/http"
	"time"

	"github.com/johneliud/real_estate_app/backend/internal/api/routes"
)

const (
	serverAddress = ":8080"
)

func main() {
	router := routes.SetupRouter()

	server := &http.Server{
		Addr:           serverAddress,
		Handler:        router,
		ReadTimeout:    10 * time.Second,
		WriteTimeout:   10 * time.Second,
		MaxHeaderBytes: 1 << 20, // 1 MB
	}

	log.Printf("Starting Real Estate API server on %s\n", serverAddress)

	if err := server.ListenAndServe(); err != nil && err != http.ErrServerClosed {
		log.Fatalf("Could not listen on %s: %v\n", serverAddress, err)
	}

	log.Println("Server stopped.")
}
