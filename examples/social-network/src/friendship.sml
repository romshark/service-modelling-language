model SocialNetwork

relation Friendship: <-> []User.friends {
	# request links the friendship request that initiated this friendship
	request -> FriendshipRequest
}
