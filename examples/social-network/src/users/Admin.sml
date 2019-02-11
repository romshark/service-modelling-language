user SocialNetwork::Admin

use {
	"std" 1.0
}

properties {
	name       PersonName
	email      EmailAddress
	rights     AdminRights
	activities <-> []AdminActivity.admin |>
		sort($, Order::Descending, AdminActivity.time)
}

# Accessing administrator is allowed to view other administrator's profiles
access Admin {
	allow Admin as $accessor if $accessor.rights.viewAdminProfiles
}
