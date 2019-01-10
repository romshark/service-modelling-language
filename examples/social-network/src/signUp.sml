model SocialNetwork

# SignUp creates a new user account that must yet be activated
transact SignUp (
	name              PersonName
	email             EmailAddress
	gender            ?Gender
	biography         ?Text
	avatar            ?Picture
	phone             ?PhoneNumber
	birthDate         ?Time
	residence         ?Residence
	spokenLanguages   ?[]Language
	employmentHistory ?[]Organization
	access            ?ProfileAccessPermissions
) {
	newUser User
}

# SignUp is accessible to the public
access SignUp public
