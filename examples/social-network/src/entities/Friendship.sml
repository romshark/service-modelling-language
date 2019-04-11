use {
	"std" 1.0
}

# Friendship represents a friendship relation between two users
entity socialNetwork::Friendship {
	users Array<User>

	# request links the friendship request that initiated this friendship
	request FriendshipRequest
}

constraints {
	# The list of users in a friendship must contain exactly two different users
	require (users as $u) => length($u) == 2
}
