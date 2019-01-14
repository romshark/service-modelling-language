model SocialNetwork

relation Friendship: <-> []User.friends {
	# establishment defines the time when the friendship relationship was
	# established
	establishment Time

    //TODO: add link to friendship request
}
