package raindrops

import "fmt"

func Convert(number int) string {
	results := ""
	if number%3 == 0 {
		results += "Pling"
	}
	if number%5 == 0 {
		results += "Plang"
	}
	if number%7 == 0 {
		results += "Plong"
	}
	if results == "" {
		return fmt.Sprint(number)
	}
	return results
}
