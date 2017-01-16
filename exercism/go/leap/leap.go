// Package leap implements a function IsLeapYear which returns a boolean
// indicating whether a given year is a leap year or not.
package leap

import (
  "math"
)

// testVersion should match the targetTestVersion in the test file.
const testVersion = 2


func isDivisibleBy(x, y int) bool {
  if math.Mod(float64(x), float64(y)) == 0 {
    return true
  } else {
    return false
  }
}

// IsLeapYear which returns a boolean indicating whether a given year is a
// leap year or not.
func IsLeapYear(year int) bool {
	if isDivisibleBy(year, 400) {
    return true
  } else if isDivisibleBy(year, 100) {
    return false
  } else if isDivisibleBy(year, 4) {
    return true
  } else {
    return false
  }
}
