use {
	"std" 1.0
}

user socialNetwork::Admin {
	name       PersonName
	email      EmailAddress
	rights     AdminRights
	activities collection<AdminActivity>(
		($a) => $a.admin == this,
		Order::desc,
		AdminActivity.time,
	)
}

# Accessing administrator is allowed to view other administrator's profiles
access {
	allow Admin as $accessor if $accessor.rights.viewAdminProfiles
}
