// Package gigasecond implements a function for adding a gigasecond to a
// time.Time
package gigasecond

import (
	"time"
)

// Constant declaration.
const testVersion = 4

// Gigasecond constant
const gigasecond = 1e9 * time.Second

// AddGigasecond adds 10^9 seconds to a time.Time.
func AddGigasecond(t time.Time) time.Time {
	t = t.Add(time.Duration(gigasecond))
	return t
}
