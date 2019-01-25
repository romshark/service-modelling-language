relation SocialNetwork::Friendship

between User.friends <-> []User.friends

properties {
	# request links the friendship request that initiated this friendship
	request -> FriendshipRequest
}
