package isogram

import (
	"strings"
	"unicode"
)

func IsIsogram(word string) bool {
	m := make(map[rune]bool)

	for _, c := range strings.ToLower(word) {
		if unicode.IsLetter(c) {
			if m[c] {
				return false
			}
			m[c] = true
		}
	}

	return true
}
