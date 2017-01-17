// Package hamming implements a function which calculates Hamming Distance
package hamming

import (
	"errors"
)

// Define which test version to use
const testVersion = 5

// Distance returns the Hammin Distance between two strings representing DNA
// strands
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return -1, errors.New("strings must have equal length")
	}
	strandLength := len(a)
	distance := 0
	for i := 0; i < strandLength; i++ {
		if a[i] != b[i] {
			distance++
		}
	}
	return distance, nil
}
