use {
	"std/time" 1.0
}

# Employment represents an employment relationship between an organization
# and a user
entity socialNetwork::Employment {
	organization Organization
	user         User

	# begin specifies the time at which the employment began
	begin Time

	# end is nil if the employment is still going
	end ?Time

	position ?socialNetwork::Text
}
