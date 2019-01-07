model SocialNetwork

# SavePostDraftBusiness saves a business post draft
transact SavePostDraftBusiness(
	business *Business
	admin    *User
	content  Text
) {
	savedDraft Post
}

access SavePostDraftBusiness {
	User {
		*accessor in accessed.business.pageAdmins && *accessor == accessed.admin
	}
}
