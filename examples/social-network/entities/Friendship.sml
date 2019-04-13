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
	error => match {
		len(this.users) != 2 = "a friendship must reference exactly 2 users"
		any(this.users, ($u) => len(filter(this.user, ($x) => $x == $u) > 1)) =
			"a friendship must reference two different users"
	}
}
