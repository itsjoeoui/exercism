package space

type Planet string

func Age(seconds float64, planet Planet) float64 {
	switch planet {
	case "Earth":
		return seconds / 31557600
	case "Mercury":
		return seconds / 31557600 / 0.240846
	case "Venus":
		return seconds / 31557600 / 0.61519726
	case "Mars":
		return seconds / 31557600 / 1.8808158
	case "Jupiter":
		return seconds / 31557600 / 11.862615
	case "Saturn":
		return seconds / 31557600 / 29.447498
	case "Uranus":
		return seconds / 31557600 / 84.016846
	case "Neptune":
		return seconds / 31557600 / 164.79132
	default:
		return -1
	}
}
