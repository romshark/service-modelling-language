model SocialNetwork

relation Employment: []Organization.employees <-> []User.employmentHistory {
	# begin specifies the time at which the employment began
	begin Time

	# end is null if the employment is still going
	end ?Time

	position ?Text
}
