# Employment represents an employment relationship between an organization
# and a user
entity SocialNetwork::Employment

use {
	"std" 1.0
}

properties {
	organization <-> Organization.employments
	user         <-> User.employmentHistory

	# begin specifies the time at which the employment began
	begin Time

	# end is nil if the employment is still going
	end ?Time

	position ?Text
}
