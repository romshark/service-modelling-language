# UpdateUser updates a user profile changing the given fields
transaction SocialNetwork::UpdateUser

arguments {
    $user ID<User>

	$name              ?PersonName
	$gender            ?Gender
	$biography         ?Text
	$avatar            ?Picture
	$email             ?EmailAddress
	$phone             ?PhoneNumber
	$birthDate         ?Time
	$residence         ?City
	$spokenLanguages   ?[]Language
	$employmentHistory ?[]EmploymentForm
	$access            ?ProfileAccessPermissionsForm
}

results {
	user User
}

errors {
    # ErrInvalidEmploymentHistory is returned if the employment history
    # contains semantic errors like intersecting time periods or multiple
    # active employments
    ErrInvalidEmploymentHistory
}


# UpdateUser is accessible to the profile owner only
access UpdateUser {
	allow User as $accessor if $accessor == $user
}
