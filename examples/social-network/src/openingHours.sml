model SocialNetwork

struct TimeRange {
	from Time
	to   Time
}

enum OpeningHoursSpecial {
	AlwaysOpen
	PermanentlyClosed
}

struct OpeningHoursSchedule {
	monday    TimeRange
	tuesday   TimeRange
	wednesday TimeRange
	thursday  TimeRange
	friday    TimeRange
	saturday  TimeRange
	sunday    TimeRange
}
