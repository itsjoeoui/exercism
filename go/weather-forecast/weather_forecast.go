// Package weather is used to forecast the weather.
package weather

// CurrentCondition is a global variable that holds the current weather condition.
var CurrentCondition string

// CurrentLocation is a global variable that holds the current location.
var CurrentLocation string

// Forecast returns the current weather condition for a given city.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
