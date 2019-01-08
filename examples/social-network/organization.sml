model SocialNetwork

# Organization represents a profile of an organization
entity Organization {
	# id represents a configurable unique profile id
	id ?String

	name         Text
	description  Text
	registration Time
	type         OrganizationType
	phone        PhoneNumber
	address      Address
	website      URL
	contactEmail EmailAddress
	openingHours ?(OpeningHoursSpecial | OpeningHoursSchedule)
	imprint      Text
	posts        Posts
	ratings      []OrganizationRating

	# parentOrganization links the parent organization if this organization
	# is a subsidiary
	parentOrganization ?Organization
	
	# subsidiaries links any subsidiary organizations
	subsidiaries []Organization

	# employees links all present and past employees
	employees []User {
		sort   asc employees:relation.start
	}

	# presentEmployees links all current employees
	presentEmployees -> employees {
		filter :relation.end == null
	}

	# pageAdmins lists all page administrators
	pageAdmins []User
}

relation OrganizationPageAdmins:
	[]Organization <-> []User (pageAdmins, managedOrganizationPages)

relation OrganizationCityLocation:
	[]Organization <-> City (address, organizations)

relation OrganizationSubsidiaries:
	Organization <-> []Organization (subsidiaries, parentOrganization)

# An organization is publicly accessible
access Organization public

# The list of page administrators is only accessible to page administrators
access Organization.pageAdmins as accessed {
	allow Admin
	allow User as accessor {
		if *accessor in accessed.pageAdmins
	}
}

# All post nodes except the published and trending ones are only be accessible
# to the organization's page administrators
access Organization.posts as accessed {
	allow Admin
	allow User as accessor {
		if *accessor in accessed.pageAdmins
	}
}

access Organization.posts.published public
access Organization.posts.trending public