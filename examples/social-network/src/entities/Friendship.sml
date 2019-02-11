# Friendship represents a friendship relation between two users
entity SocialNetwork::Friendship

use {
	"std" 1.0
}

properties {
	users <-> []User.friendships

	# request links the friendship request that initiated this friendship
	request -> FriendshipRequest
}

constraints {
	# The list of users in a friendship must contain exactly two different users
	require length(this.users) == 2
}
