package main

import (
	"log"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"github.com/satt12/ayocuci-app/backend/config"
	"github.com/satt12/ayocuci-app/backend/internal/models"
)

func main() {
	// Load .env
	if err := godotenv.Load(); err != nil {
		log.Println("No .env file found")
	}

	// Koneksi database
	config.ConnectDatabase()

	// Auto migrate tabel
	config.DB.AutoMigrate(&models.User{})

	// Init Gin
	r := gin.Default()

	// Test route
	r.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Selamat datang di Ayo Cuci API!",
			"status":  "running",
		})
	})

	// Jalankan server
	port := os.Getenv("APP_PORT")
	if port == "" {
		port = "8080"
	}

	log.Printf("Server berjalan di port %s", port)
	r.Run(":" + port)
}
