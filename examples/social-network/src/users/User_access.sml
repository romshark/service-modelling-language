user socialNetwork::User

use {
	"std" 1.0
}

# Basic user profile access permissions
access {
	allow Admin

	# A user is allowed to access the profile if the profile is public and
	# the user is a friend. If the profile is black-list protected then the user
	# is only allowed to access if not listed in the black-list, otherwise if
	# the profile is white-list protected then the user is only allowed to
	# access if listed in the white-list
	allow User as $accessor if $accessor == this or
		this.access.profile as $v {
			Visibility = $v == Visibility::public or $accessor in this.friends
			VisibilityBlacklist = $accessor !in $v
			VisibilityWhitelist = $accessor in $v
		}
}

access posts.all {
	allow User as $accessor if $accessor == this
}

# Archived posts are only accessible to administrators
access posts.archived {
	allow Admin
}

# User email address access permissions
access email {
	allow Admin
	allow User as $accessor if $accessor == this or
		this.access.email as $v {
			Visibility = match $v {
				Visibility::public  = true
				Visibility::friends = $accessor in this.friends
			}
			VisibilityBlacklist = $accessor !in $v
			VisibilityWhitelist = $accessor in $v
		}
}

# User phone number permissions
access phone {
	allow Admin
	allow User as $accessor if $accessor == this or
		this.access.phone as $v {
			Visibility = match $v {
				Visibility::public  = true
				Visibility::friends = $accessor in this.friends
			}
			VisibilityBlacklist = $accessor !in $v
			VisibilityWhitelist = $accessor in $v
		}
}

# User birthDate access permissions
access birthDate {
	allow Admin
	allow User as $accessor if $accessor == this or
		this.access.birthDate as $v {
			Visibility = match $v {
				Visibility::public  = true
				Visibility::friends = $accessor in this.friends
			}
			VisibilityBlacklist = $accessor !in $v
			VisibilityWhitelist = $accessor in $v
		}
}


# User friend list access permissions
access friends {
	allow Admin
	allow User as $accessor if $accessor == this or
		this.access.friends as $v {
			Visibility = match $v {
				Visibility::public  = true
				Visibility::friends = $accessor in this.friends
			}
			VisibilityBlacklist = $accessor !in $v
			VisibilityWhitelist = $accessor in $v
		}
}

# Access permissions of the access permission configurations
access access {
	allow Admin

	# Only the profile owner is allowed to access the profile's access
	# permission configurations
	allow User as $accessor if $accessor == this
}

# User residence access permissions
access residence {
	allow Admin
	allow User as $accessor if $accessor == this or
		this.access.residence as $v {
			Visibility = match $v {
				Visibility::public  = true
				Visibility::friends = $accessor in this.friends
			}
			VisibilityBlacklist = $accessor !in $v
			VisibilityWhitelist = $accessor in $v
		}
}

# The inbox is accessible only to its owner
access inbox {
	allow User as $accessor if $accessor == this
}

# The outbox is accessible only to its owner
access outbox {
	allow User as $accessor if $accessor == this
}

# The list of managed organization pages is accessible only to its owner
access managedOrganizationPages {
	allow User as $accessor if $accessor == this
}

# The activation time is accessible ony to the profile owner
access activation {
	allow User as $accessor if $accessor == this
}
