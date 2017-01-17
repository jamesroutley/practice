// Package pangram implements a function which returns whether a sentence is a
// pangram
package pangram

import (
	"regexp"
	"strings"
)

const testVersion = 1

// ACSII codes for the letters "a" and "z"
const (
	aASCII = 97
	zASCII = 122
)

// Pattern matching lower and uppercase English letters
var asciiLettersRe = regexp.MustCompile("[^a-zA-Z]")

// IsPangram returns a boolean, indicating whether sentence is a pangram.
func IsPangram(sentence string) bool {
	s := []byte(strings.ToLower(sentence))
	s = asciiLettersRe.ReplaceAll(s, []byte(""))
	alphabet := make(map[byte]bool)
	for _, letter := range s {
		alphabet[letter] = true
	}
	for i := aASCII; i <= zASCII; i++ {
		if alphabet[byte(i)] == false {
			return false
		}
	}
	return true
}
