model SocialNetwork

# DeclineFriendshipRequest declines a friendship request triggering the
# FriendshipRequestDeclined event
transact DeclineFriendshipRequest(
	user *User
	from *User
)

access DeclineFriendshipRequest {
	User {
		*accessor == *accessed.user
	}
}
