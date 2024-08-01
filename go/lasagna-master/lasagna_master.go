package lasagna

func PreparationTime(layers []string, time int) int {
	if time == 0 {
		time = 2 // default average time
	}
	return len(layers) * time
}

func Quantities(layers []string) (noodles int, sauce float64) {
	for _, layer := range layers {
		switch layer {
		case "sauce":
			sauce += 0.2
		case "noodles":
			noodles += 50
		}
	}
	return
}

func AddSecretIngredient(friendsList []string, myList []string) {
	myList[len(myList)-1] = friendsList[len(friendsList)-1]
}

func ScaleRecipe(quantities []float64, scale int) []float64 {
	output := make([]float64, len(quantities))
	for i, quantity := range quantities {
		output[i] = quantity * float64(scale) / 2.0
	}

	return output
}
