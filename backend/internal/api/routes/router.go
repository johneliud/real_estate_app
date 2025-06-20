package routes

import (
	"net/http"

	"github.com/johneliud/real_estate_app/backend/internal/api/handlers"
)

// SetupRouter configures the HTTP routes for the API.
func SetupRouter() *http.ServeMux {
	mux := http.NewServeMux()

	mux.HandleFunc("/api/properties", CORSMiddleware(handlers.GetPropertiesHandler))
	mux.HandleFunc("/api/properties/", CORSMiddleware(handlers.GetPropertyByIDHandler))
	return mux
}

// CORSMiddleware is a simple middleware to allow CORS for development.
func CORSMiddleware(next http.HandlerFunc) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		// Set headers
		w.Header().Set("Access-Control-Allow-Origin", "http://localhost:8080")
		w.Header().Set("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")
		w.Header().Set("Access-Control-Allow-Headers", "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization")

		// If it's an OPTIONS request, respond with 200 OK
		if r.Method == "OPTIONS" {
			w.WriteHeader(http.StatusOK)
			return
		}
		next(w, r)
	}
}
