package strand

import "strings"

var Mapping = map[rune]rune{
	'G': 'C',
	'C': 'G',
	'T': 'A',
	'A': 'U',
}

func ToRNA(dna string) string {
	translation := strings.Builder{}

	for _, nucleotide := range dna {
		translation.WriteRune(Mapping[nucleotide])
	}

	return translation.String()
}
