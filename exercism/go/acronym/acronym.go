// Package acronym implements a function which abbreviates phrases
package acronym

import (
	"regexp"
	"strings"
)

// Define which test version to use
const testVersion = 2

// Matches individual words, defined as:
// - One or more uppercase letters followed by zero or more lowercase
// - One or more lowercase letters
// This pattern has a side effect of treating the different sections of
// CamelCase words as different words, which is the desired behaviour under
// the current definition of acronym.
var re = regexp.MustCompile(`[A-Z]+[a-z]*|[a-z]+`)

// Abbreviate returns the acronym of s
func Abbreviate(s string) string {
	matches := re.FindAllString(s, -1)
  var acronym = ""
  for _, match := range matches {
    acronym += string(match[0])
  }
  acronym = strings.ToUpper(acronym)
	return acronym
}
