package handlers

import (
	"encoding/json"
	"log"
	"net/http"
	"strings"

	"github.com/johneliud/real_estate_app/backend/internal/domain"
)

// GetPropertiesHandler handles requests for listing all properties.
func GetPropertiesHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	properties := domain.GetMockProperties()

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	if err := json.NewEncoder(w).Encode(properties); err != nil {
		http.Error(w, "Failed to encode properties to JSON", http.StatusInternalServerError)
		log.Println("Failed to encode properties to JSON:", err)
		return
	}
}

// GetPropertyByIDHandler handles requests for a single property by its ID.
func GetPropertyByIDHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	// Simple path parsing to get the ID.
	parts := strings.Split(r.URL.Path, "/")
	if len(parts) < 1 {
		http.Error(w, "Invalid path", http.StatusBadRequest)
		return
	}
	id := parts[len(parts)-1] // Get the last segment as ID

	if id == "" {
		http.Error(w, "Property ID is required", http.StatusBadRequest)
		return
	}

	property, found := domain.GetMockPropertyByID(id)
	if !found {
		http.Error(w, "Property not found", http.StatusNotFound)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	if err := json.NewEncoder(w).Encode(property); err != nil {
		http.Error(w, "Failed to encode property to JSON", http.StatusInternalServerError)
		log.Println("Failed to encode properties to JSON:", err)
	}
}
