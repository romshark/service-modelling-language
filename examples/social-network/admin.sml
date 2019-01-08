model SocialNetwork

struct AdminRights {
	viewAdminProfiles Bool
	banUsers          Bool
}

user Admin {
	name       PersonName
	email      EmailAddress
	rights     AdminRights
	activities []AdminActivity {
		sort desc AdminActivity.time
	}
}

access Admin {
	Admin {
		# Accessing administrator is allowed to view other administrator's
		# profiles
		accessor.rights.viewAdminProfiles
	}
}
