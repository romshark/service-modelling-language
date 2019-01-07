model SocialNetwork

# SavePostDraft saves a post draft
transact SavePostDraft(
	author  *User
	content Text
) {
	savedDraft Post
}

access SavePostDraft {
	User {
		*accessor == accessed.author
	}
}
