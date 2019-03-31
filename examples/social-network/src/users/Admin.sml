user socialNetwork::Admin

use {
	"std" 1.0
}

properties {
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
access Admin {
	allow Admin as $accessor if $accessor.rights.viewAdminProfiles
}
