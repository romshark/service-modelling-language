use {
	"std"      1.0
	"std/time" 1.0
}

# UpdateUser updates a user profile changing the given fields
transaction socialNetwork::UpdateUser (
	$user User,

	$name            ?PersonName,
	$gender          ?Gender,
	$biography       ?(socialNetwork::Text or ResetValue),
	$avatar          ?(Picture or ResetValue),
	$email           ?EmailAddress,
	$phone           ?(PhoneNumber or ResetValue),
	$birthDate       ?(Time or ResetValue),
	$residence       ?(City or ResetValue),
	$spokenLanguages ?SpokenLanguages,
	$access          ?ProfileAccessPermissions,
)

-> (Error or User) => mutated($user, {
	name: $name as PersonName or $user.name
	gender: $gender as Gender or $user.gender

	biography: $biography as $v {
		ResetValue then nil
		socialNetwork::Text then $v
		else $user.biography
	}

	avatar: $avatar as $v {
		ResetValue then nil
		Picture then $v
		else $user.avatar
	}

	email: $email as EmailAddress or $user.email

	phone: $phone as $v {
		ResetValue then nil
		PhoneNumber then $v
		else $user.phone
	}

	birthDate: $birthDate as $v {
		ResetValue then nil
		Time then $v
		else $user.birthDate
	}

	residence: $residence as $v {
		ResetValue then nil
		City then $v
		else $user.residence
	}
	
	spokenLanguages: $spokenLanguages as
		SpokenLanguages or $user.spokenLanguages
	
	access: $access as ProfileAccessPermissions or $user.access
})

# UpdateUser is accessible to the profile owner only
access UpdateUser {
	allow User as $accessor if $accessor == $user
}
