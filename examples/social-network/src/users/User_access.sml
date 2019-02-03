user SocialNetwork::User

# Basic user profile access permissions
access {
	allow Admin
	allow User as $accessor {
		this.access.profile {
		Visibility:
			# The profile is public
			if this.access.profile == Visibility::public
			
			# The profile is accessible to all friends by default
			# and the $accessor is a friend
			if $accessor in this.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			if $accessor !in this.access.profile

		VisibilityWhitelist:
			# The user is in the whitelist
			if $accessor in this.access.profile
		}
	}
}

# All post nodes except the published and trending ones are only accessible to
# their owner
access posts {
	allow Admin
	allow User as $accessor {
		if $accessor == this
	}
}

access posts.published {
	allow public
}

access posts.trending {
	allow public
}

# User email address access permissions
access email {
	allow Admin
	allow User as $accessor {
		this.access.email {
		Visibility:
			# The email is public
			if this.access.email == Visibility::public
			
			# The email address is visible to friends only
			# and the $accessor is a friend
			if this.access.email == Visibility::friends &&
                $accessor in this.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			if $accessor !in this.access.email

		VisibilityWhitelist:
			# The user is in the whitelist
			if $accessor in this.access.email
		}
	}
}

# User email phone number permissions
access phone {
	allow Admin
	allow User as $accessor {
		this.access.phone {
		Visibility:
			# The phone number is public
			if this.access.phone == Visibility::public
			
			# The phone number is visible to friends only
			# and the $accessor is a friend
			if this.access.phone == Visibility::friends &&
                $accessor in this.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			if $accessor !in this.access.phone

		VisibilityWhitelist:
			# The user is in the whitelist
			if $accessor in this.access.phone
		}
	}
}

# User birthDate access permissions
access birthDate {
	allow Admin
	allow User as $accessor {
		this.access.birthDate {
		Visibility:
			# The birthDate is public
			if this.access.birthDate == Visibility::public
			
			# The birthDate is visible to friends only
			# and the $accessor is a friend
			if this.access.birthDate == Visibility::friends &&
                $accessor in this.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			if $accessor !in this.access.birthDate

		VisibilityWhitelist:
			# The user is in the whitelist
			if $accessor in this.access.birthDate
		}
	}
}


# User friend list access permissions
access friends {
	allow Admin
	allow User as $accessor {
		this.access.friends {
		Visibility:
			# The friend list is public
			if this.access.friends == Visibility::public

			# The friend list is visible to friends only
			# and the $accessor is a friend
			if this.access.friends == Visibility::friends &&
                $accessor in this.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			if $accessor !in this.access.friends

		VisibilityWhitelist:
			# The user is in the whitelist
			if $accessor in this.access.friends
		}
	}
}

# Access permissions of the access permission configurations
access access {
	allow Admin
	allow User as $accessor {
		# The user is the owner of the profile
		if $accessor == this
	}
}

# User residence access permissions
access residence {
	allow Admin
	allow User as $accessor {
		this.access.residence {
		Visibility:
			# The residence is public
			if this.access.residence == Visibility::public

			# The residence is visible to friends only
			# and the $accessor is a friend
			if this.access.residence == Visibility::friends &&
				$accessor in this.residence

		VisibilityBlacklist:
			# The user is not in the blacklist
			if $accessor !in this.access.residence

		VisibilityWhitelist:
			# The user is in the whitelist
			if $accessor in this.access.residence
		}
	}
}

access mutualFriends {
	allow Admin
	allow User as $accessor {
		# The user is the target of the mutual friends search
		this.target == $accessor && this.access.friends {
		Visibility:
			# The friend list is public
			if this.access.friends == Visibility::public

			# The friend list is visible to friends only
			# and the $accessor is a friend
			if this.access.friends == Visibility::friends &&
				$accessor in this.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			if $accessor !in this.access.friends

		VisibilityWhitelist:
			# The user is in the whitelist
			if $accessor in this.access.friends
		}
	}
}

# The inbox is accessible only to its owner
access inbox {
	allow User as $accessor {
		if $accessor == this
	}
}

# The outbox is accessible only to its owner
access outbox {
	allow User as $accessor {
		if $accessor == this
	}
}

# The list of managed organization pages is accessible only to its owner
access managedOrganizationPages {
	allow User as $accessor {
		if $accessor == this
	}
}

# The activation time is accessible ony to the profile owner
access activation {
	allow User as $accessor {
		if $accessor == this
	}
}
