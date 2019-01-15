model SocialNetwork

struct EmploymentForm {
    organization *Organization
    begin        Time
    end          ?Time
	position     ?Text
}

# UpdateUser updates a user profile changing the given fields
transact UpdateUser (
    user *User

	name              ?PersonName
	gender            ?Gender
	biography         ?Text
	avatar            ?Picture
	email             ?EmailAddress
	phone             ?PhoneNumber
	birthDate         ?Time
	residence         ?City
	spokenLanguages   ?[]Language
	employmentHistory ?[]EmploymentForm
	access            ?ProfileAccessPermissions
) {
	user User
}

# UpdateUser is accessible to the profile owner only
access UpdateUser as accessed {
	allow User as accessor {
        if *accessor == accessed.user
    }
}

error ErrInvalidEmploymentHistory {}

errors UpdateUser {
    # ErrInvalidEmploymentHistory is returned if the employment history
    # contains semantic errors like intersecting time periods or multiple
    # active employments
    ErrInvalidEmploymentHistory
}
