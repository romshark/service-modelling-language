use {
	"std" 1.0
}

user socialNetwork::Admin {
	name       PersonName
	email      EmailAddress
	rights     AdminRights
	activities Collection<AdminActivity> {
		predicate: ($a) => $a.admin == this
		order:     Order::desc
		orderBy:   AdminActivity.time
	}
}

# Accessing administrator is allowed to view other administrator's profiles
access {
	allow Admin as $accessor if $accessor.rights.viewAdminProfiles
}
