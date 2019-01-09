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

access Admin as accessed {
	allow Admin as accessor {
		# Accessing administrator is allowed to view other administrator's
		# profiles
		if accessor.rights.viewAdminProfiles
	}
}
