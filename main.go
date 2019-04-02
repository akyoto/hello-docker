package main

import (
	"fmt"

	"github.com/aerogo/aero"
)

func main() {
	fmt.Println("Hello Docker")

	app := aero.New()

	app.Get("/", func(ctx *aero.Context) string {
		return ctx.Text("Hello Docker")
	})

	app.Run()
}
