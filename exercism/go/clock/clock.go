// package clock provides a basic time-only clock.
package clock

import (
	"fmt"
)

// The value of testVersion here must match `targetTestVersion` in the file
// clock_test.go.
const testVersion = 4

// A Clock represents the time, with hours and minute precision.
type Clock struct {
	hour, minute int
}

// New creates a new Clock
func New(hour, minute int) Clock {
	c := Clock{hour, minute}
	c.normalise()
	return c
}

// String returns a string representing the time ("00:00", "15:20" etc).
func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c.hour, c.minute)
}

// Add returns a clock with minutes added to it. Add correctly handles negative
// minute values.
func (c Clock) Add(minutes int) Clock {
	c_new := Clock{c.hour, c.minute + minutes}
	c_new.normalise()
	return c_new
}

// normalise converts impossible times to their correct value. For example,
// 00:65 -> 01:05.
func (c *Clock) normalise() {
	var h int
	h, c.minute = normaliseMinutes(c.minute)
	c.hour = normaliseHours(c.hour + h)
}

// normaliseMinutes returns the normalied hours and minutes
// 65 -> 1, 5; -5 -> -1, 55
func normaliseMinutes(m int) (int, int) {
	h := 0
	if m < 0 {
		for m < 0 {
			h -= 1
			m += 60
			for m < -59 {
				h -= 1
				m += 60
			}
		}
	} else {
		for m > 59 {
			m -= 60
			h += 1
		}
	}
	return h, m
}

// normaliseHours returns the normalised hours 24 -> 0; -1 -> 23
func normaliseHours(h int) int {
	for h > 23 {
		h -= 24
	}
	for h < 0 {
		h += 24
	}
	return h
}
