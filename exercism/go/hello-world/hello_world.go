// Package greeting implements a Hello World function.
package greeting

import (
	"bytes"
)

// testVersion identifies the version of the test program that you are
// writing your code to. If the test program changes in the future --
// after you have posted this code to the Exercism site -- nitpickers
// will see that your code can't necessarily be expected to pass the
// current test suite because it was written to an earlier test version.
const testVersion = 3

// HelloWorld returns the string "Hello, <string>!". If <string> is the empty
// string, HelloWorld returns the string "Hello, World!".
func HelloWorld(str string) string {
	var buffer bytes.Buffer
	var name string

	if str != "" {
		name = str
	} else {
		name = "World"
	}

	buffer.WriteString("Hello, ")
	buffer.WriteString(name)
	buffer.WriteString("!")

	return buffer.String()
}
