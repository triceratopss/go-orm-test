package main

import (
	"context"
	"fmt"
	"go-orm-test/packages/db"
	"log"
	"time"

	"github.com/uptrace/bun"
)

type User struct {
	bun.BaseModel `bun:"table:users"`

	ID   int    `bun:",pk,autoincrement"`
	Name string `bun:"name"`
	Age  int    `bun:"age"`

	CreatedAt time.Time `bun:",nullzero"`
	UpdatedAt time.Time `bun:",nullzero"`
	DeletedAt time.Time `bun:",soft_delete,nullzero"`
}

func main() {
	ctx := context.Background()

	db, err := db.NewBunDB()
	if err != nil {
		log.Fatalf("failed to initialize a new database: %v", err)
	}

	var users []User

	if err := db.NewSelect().Model(&users).Scan(ctx); err != nil {
		log.Fatalf("failed to initialize a new database: %v", err)
	}

	fmt.Println(users)
}
