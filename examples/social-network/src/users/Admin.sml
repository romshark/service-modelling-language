user SocialNetwork::Admin

properties {
	name       PersonName
	email      EmailAddress
	rights     AdminRights
	activities <-> []AdminActivity.admin |> sort $ desc AdminActivity.time
}

# Accessing administrator is allowed to view other administrator's profiles
access Admin {
	allow Admin as $accessor if $accessor.rights.viewAdminProfiles
}
