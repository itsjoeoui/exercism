package diffsquares

func SquareOfSum(n int) int {
	// digits := breakIntoDigits(n)
	//
	// sum := 0
	// for _, digit := range digits {
	// 	sum += digit
	// }
	//
	// return sum * sum

	sum := (n * (n + 1)) / 2
	return sum * sum
}

func SumOfSquares(n int) int {
	// digits := breakIntoDigits(n)
	//
	// sum := 0
	// for _, digit := range digits {
	// 	sum += digit * digit
	// }
	//
	// return sum

	sum := (n * (n + 1) * (2*n + 1)) / 6
	return sum
}

func Difference(n int) int {
	return SquareOfSum(n) - SumOfSquares(n)
}

// func breakIntoDigits(n int) []int {
// 	digits := []int{}
//
// 	for _, c := range strconv.Itoa(n) {
// 		digit, _ := strconv.Atoi(string(c))
// 		digits = append(digits, digit)
// 	}
//
// 	return digits
// }
