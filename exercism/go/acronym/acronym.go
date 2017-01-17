// Package acronym implements a function which abbreviates phrases
package acronym

import (
	"bytes"
	"regexp"
	"strings"
)

// Define which test version to use
const testVersion = 2

// Abbreviate returns the acronym of s
func Abbreviate(s string) string {
	// First capture group searches for letters after word boundaries.
	// Second capture group searches for capital letters after lowercase letters,
	// as seen in CamelCase
	re := regexp.MustCompile(`(\b\w)|[a-z]([A-Z])`)
	matches := re.FindAllStringSubmatch(s, -1)
	var acronym bytes.Buffer
	for _, match := range matches {
		var initial string
		if match[2] != "" {
			initial = match[2]
		} else {
			initial = match[1]
		}
		acronym.WriteString(strings.ToUpper(initial))
	}
	return acronym.String()
}
