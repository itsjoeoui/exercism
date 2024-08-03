package booking

import (
	"time"
)

func ParseDateWithLayout(date, layout string) time.Time {
	parsedDate, err := time.Parse(layout, date)
	if err != nil {
		panic(err)
	}
	return parsedDate
}

// Schedule returns a time.Time from a string containing a date.
func Schedule(date string) time.Time {
	return ParseDateWithLayout(date, "1/2/2006 15:04:05")
}

// HasPassed returns whether a date has passed.
func HasPassed(date string) bool {
	parsedDate := ParseDateWithLayout(date, "January 2, 2006 15:04:05")

	return time.Now().After(parsedDate)
}

// IsAfternoonAppointment returns whether a time is in the afternoon.
func IsAfternoonAppointment(date string) bool {
	parsedDate := ParseDateWithLayout(date, "Monday, January 2, 2006 15:04:05")
	return parsedDate.Hour() >= 12 && parsedDate.Hour() < 18
}

// Description returns a formatted string of the appointment time.
func Description(date string) string {
	return ParseDateWithLayout(date, "1/2/2006 15:04:05").Format("You have an appointment on Monday, January 2, 2006, at 15:04.")
}

// AnniversaryDate returns a Time with this year's anniversary.
func AnniversaryDate() time.Time {
	return time.Date(time.Now().Year(), time.September, 15, 0, 0, 0, 0, time.UTC)
}
