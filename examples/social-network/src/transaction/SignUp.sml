# SignUp creates a new user account that must yet be activated
transaction SocialNetwork::SignUp

arguments {
	$name              PersonName
	$email             EmailAddress
	$gender            ?Gender
	$biography         ?Text
	$avatar            ?Picture
	$phone             ?PhoneNumber
	$birthDate         ?Time
	$residence         ?Residence
	$spokenLanguages   ?[]Language
	$employmentHistory ?[]Organization
	$access            ?ProfileAccessPermissions
}

results {
	newUser User
}

# SignUp is accessible to the public
access SignUp {
	allow  public
	forbid User
	forbid Admin
}
