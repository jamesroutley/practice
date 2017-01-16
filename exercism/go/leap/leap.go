// Package leap implements a function IsLeapYear which returns a boolean
// indicating whether a given year is a leap year or not.
package leap

import ()

// testVersion should match the targetTestVersion in the test file.
const testVersion = 2

// IsLeapYear returns a boolean indicating whether a given year is a
// leap year or not.
func IsLeapYear(year int) bool {
	if year%400 == 0 {
		return true
	} else if year%100 == 0 {
		return false
	} else if year%4 == 0 {
		return true
	} else {
		return false
	}
}
