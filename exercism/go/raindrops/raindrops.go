// Package raindrops implements a number to raindrop-speak converter
package raindrops

import (
	"bytes"
	"strconv"
)

// Define which test version to use
const testVersion = 2

// Convert converts a number to a string, following the raindrop rules
func Convert(n int) string {
	var response bytes.Buffer

	if n%3 == 0 {
		response.WriteString("Pling")
	}
	if n%5 == 0 {
		response.WriteString("Plang")
	}
	if n%7 == 0 {
		response.WriteString("Plong")
	}
	if len(response.Bytes()) == 0 {
		response.WriteString(strconv.Itoa(n))
	}
	return response.String()
}
