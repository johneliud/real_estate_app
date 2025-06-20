package domain

// Agent represents the real estate agent information.
type Agent struct {
	Name  string `json:"name"`
	Phone string `json:"phone"`
}

// Property represents a real estate property.
type Property struct {
	ID            string  `json:"id"`
	Title         string  `json:"title"`
	Address       string  `json:"address"`
	Price         float64 `json:"price"`
	Bedrooms      int     `json:"bedrooms"`
	Bathrooms     int     `json:"bathrooms"`
	SquareFootage int     `json:"squareFootage"`
	Description   string  `json:"description"`
	ImageURL      string  `json:"imageUrl"`
	Agent         Agent   `json:"agent"`
}

var mockProperties = []Property{
	{
		ID:            "1",
		Title:         "Spacious Downtown Loft",
		Address:       "123 Main St, Anytown, CA 90210",
		Price:         750000,
		Bedrooms:      2,
		Bathrooms:     2,
		SquareFootage: 1200,
		Description:   "A beautiful and modern loft in the heart of downtown. Features an open floor plan, high ceilings, and stunning city views.",
		ImageURL:      "https://via.placeholder.com/400x250.png?text=Loft+Image+1",
		Agent: Agent{
			Name:  "Alice Wonderland",
			Phone: "555-0101",
		},
	},
	{
		ID:            "2",
		Title:         "Cozy Suburban Home",
		Address:       "456 Oak Ave, Suburbia, TX 75001",
		Price:         320000,
		Bedrooms:      3,
		Bathrooms:     2,
		SquareFootage: 1800,
		Description:   "Charming suburban home with a large backyard, perfect for families. Recently renovated kitchen and bathrooms.",
		ImageURL:      "https://via.placeholder.com/400x250.png?text=Suburban+Home+2",
		Agent: Agent{
			Name:  "Bob The Builder",
			Phone: "555-0202",
		},
	},
	{
		ID:            "3",
		Title:         "Luxury Beachfront Villa",
		Address:       "789 Ocean Dr, Paradise City, FL 33101",
		Price:         2500000,
		Bedrooms:      5,
		Bathrooms:     4,
		SquareFootage: 4500,
		Description:   "Exquisite beachfront villa with private pool, direct beach access, and breathtaking ocean views. The ultimate luxury retreat.",
		ImageURL:      "https://via.placeholder.com/400x250.png?text=Beach+Villa+3",
		Agent: Agent{
			Name:  "Carol Danvers",
			Phone: "555-0303",
		},
	},
	{
		ID:            "4",
		Title:         "Rustic Countryside Cabin",
		Address:       "101 Forest Ln, Willow Creek, MT 59001",
		Price:         180000,
		Bedrooms:      2,
		Bathrooms:     1,
		SquareFootage: 950,
		Description:   "A cozy and rustic cabin nestled in the woods. Perfect for getaways and enjoying nature. Features a stone fireplace.",
		ImageURL:      "https://via.placeholder.com/400x250.png?text=Cabin+Image+4",
		Agent: Agent{
			Name:  "Dave Grohl",
			Phone: "555-0404",
		},
	},
}

// GetMockProperties simulates fetching all properties.
func GetMockProperties() []Property {
	return mockProperties
}

// GetMockPropertyByID simulates fetching a single property by its ID.
func GetMockPropertyByID(id string) (*Property, bool) {
	for _, p := range mockProperties {
		if p.ID == id {
			return &p, true
		}
	}
	return nil, false
}
