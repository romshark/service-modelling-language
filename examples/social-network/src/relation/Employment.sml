relation SocialNetwork::Employment

between []Organization.employees <-> []User.employmentHistory

properties {
	# begin specifies the time at which the employment began
	begin Time

	# end is null if the employment is still going
	end ?Time

	position ?Text
}
