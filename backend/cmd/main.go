package main

import (
	"log"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"github.com/satt12/ayocuci-app/backend/config"
	"github.com/satt12/ayocuci-app/backend/internal/handler"
	"github.com/satt12/ayocuci-app/backend/internal/models"
	"github.com/satt12/ayocuci-app/backend/internal/repository"
	"github.com/satt12/ayocuci-app/backend/internal/service"
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

	// Init repository, service, handler
	userRepo := repository.NewUserRepository(config.DB)
	authService := service.NewAuthService(userRepo)
	authHandler := handler.NewAuthHandler(authService)

	// Init Gin
	r := gin.Default()

	// Test route
	r.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Selamat datang di Ayo Cuci API!",
			"status":  "running",
		})
	})

	// Auth routes
	auth := r.Group("/api/auth")
	{
		auth.POST("/register", authHandler.Register)
		auth.POST("/login", authHandler.Login)
	}

	// Jalankan server
	port := os.Getenv("APP_PORT")
	if port == "" {
		port = "8080"
	}

	log.Printf("Server berjalan di port %s", port)
	r.Run(":" + port)
}
