package bookstore

func Cost(books []int) int {
	return newBookBasket(books).
		genDiscountSets().
		maximizeDiscount().
		calculateCost()
}

type bookBasket [6]int

type discountSet [5]int

func newBookBasket(books []int) bookBasket {
	basket := bookBasket{}
	for _, book := range books {
		basket[book]++
		basket[0]++
	}
	return basket
}

func (bb bookBasket) genDiscountSets() discountSet {
	discounts := discountSet{}
	for bb[0] > 0 {
		discountSize := 0
		for i := 1; i < 6; i++ {
			if bb[i] > 0 {
				discountSize++
				bb[i]--
				bb[0]--
			}
		}
		discounts[discountSize-1]++
	}

	return discounts
}

func (ds discountSet) maximizeDiscount() discountSet {
	if ds[4] > 0 && ds[2] > 0 {
		minCount := min(ds[4], ds[2])

		ds[4] -= minCount
		ds[2] -= minCount
		ds[3] += minCount * 2
	}
	return ds
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}

const (
	bookPrice          = 800.0
	OneBook            = int(bookPrice)
	DiscountTwoBooks   = int(bookPrice * 2 * 0.95)
	DiscountThreeBooks = int(bookPrice * 3 * 0.90)
	DiscountFourBooks  = int(bookPrice * 4 * 0.80)
	DiscountFiveBooks  = int(bookPrice * 5 * 0.75)
)

func (ds discountSet) calculateCost() int {
	return ds[0]*OneBook +
		ds[1]*DiscountTwoBooks +
		ds[2]*DiscountThreeBooks +
		ds[3]*DiscountFourBooks +
		ds[4]*DiscountFiveBooks
}
