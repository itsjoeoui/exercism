package chessboard

// Declare a type named File which stores if a square is occupied by a piece - this will be a slice of bools
type File [8]bool

// Declare a type named Chessboard which contains a map of eight Files, accessed with keys from "A" to "H"

type Chessboard map[string]File

func Count[T comparable](arr []T, target T) int {
	total := 0

	for _, value := range arr {
		if value == target {
			total++
		}
	}

	return total
}

// CountInFile returns how many squares are occupied in the chessboard,
// within the given file.
func CountInFile(cb Chessboard, file string) int {
	targetFile := cb[file]
	return Count(targetFile[:], true)
}

// CountInRank returns how many squares are occupied in the chessboard,
// within the given rank.
func CountInRank(cb Chessboard, rank int) int {
	total := 0
	for _, file := range cb {
		for idx, square := range file {
			if idx+1 == rank && square {
				total++
			}
		}
	}

	return total
}

// CountAll should count how many squares are present in the chessboard.
func CountAll(cb Chessboard) int {
	total := 0
	for _, file := range cb {
		total += len(file)
	}
	return total
}

// CountOccupied returns how many squares are occupied in the chessboard.
func CountOccupied(cb Chessboard) int {
	total := 0
	for _, file := range cb {
		total += Count(file[:], true)
	}
	return total
}
