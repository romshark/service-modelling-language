# SignUp creates a new user account that must yet be activated
transaction SocialNetwork::SignUp

use {
	"std"      1.0
	"std/time" 1.0
}

parameters {
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
	allow  anyone
	forbid User
	forbid Admin
}
