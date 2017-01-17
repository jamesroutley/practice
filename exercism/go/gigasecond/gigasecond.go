// Package gigasecond implements a function for adding a gigasecond to a
// time.Time
package gigasecond

import (
	"time"
)

// Constant declaration.
const testVersion = 4

// AddGigasecond adds 10^9 seconds to a time.Time.
func AddGigasecond(t time.Time) time.Time {
	d := time.Duration(1000000000) * time.Second
	t = t.Add(d)
	return t
}
