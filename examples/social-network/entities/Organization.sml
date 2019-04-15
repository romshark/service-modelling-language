use {
	"std"      1.0
	"std/time" 1.0
}

# Organization represents a profile of an organization
entity socialNetwork::Organization {
	# id represents a configurable unique profile id
	id ?String

	name         socialNetwork::Text
	description  socialNetwork::Text
	registration Time
	type         OrganizationType
	phone        PhoneNumber
	address      Address
	website      URL
	contactEmail EmailAddress
	openingHours ?OrganizationOpeningHours
	imprint      socialNetwork::Text

	posts posts(this)

	ratings collection<OrganizationRating>(
		($or) => $or.organization == this,
		Order::desc,
		OrganizationRating.publication,
	)

	# parentOrganization links the parent organization if this organization
	# is a subsidiary
	parentOrganization ?Organization
	
	# subsidiaries links any subsidiary organizations
	subsidiaries collection<Organization>(
		predicate = ($o) => $o.parentOrganization,
		order     = Order::desc,
	)

	# employments links all present and past employments
	employments collection<Employment>(
		($e) => $e.organization == this,
		Order::asc,
		Employment.start,
	)

	# presentEmployments links all current employments
	presentEmployments collection<Employment>(
		($e) => $e.organization == this and $e.end == nil,
		Order::asc,
		Employment.start,
	)

	# pageAdmins lists all page administrators
	pageAdmins Array<User>
}

access {
	# An organization is publicly accessible
	allow anyone
}

# The list of page administrators is only accessible to page administrators
access pageAdmins {
	allow Admin
	allow User as $accessor if $accessor in this.pageAdmins
}

# All post nodes except the published and trending ones are only be accessible
# to the organization's page administrators
access posts.all {
	allow Admin
	allow User as $accessor if $accessor in this.pageAdmins
}

access posts.archived {
	allow Admin
	allow User as $accessor if $accessor in this.pageAdmins
}

access posts.published {
	allow anyone
}

access posts.trending {
	allow anyone
}
