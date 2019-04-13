use {
	"std"      1.0
	"std/time" 1.0
}

# UpdateUser updates a user profile changing the given fields
transaction socialNetwork::UpdateUser {
	$user User

	$name            ?PersonName
	$gender          ?Gender
	$biography       ?(Text or ResetValue)
	$avatar          ?(Picture or ResetValue)
	$email           ?EmailAddress
	$phone           ?(PhoneNumber or ResetValue)
	$birthDate       ?(Time or ResetValue)
	$residence       ?(City or ResetValue)
	$spokenLanguages ?SpokenLanguages
	$access          ?ProfileAccessPermissions
}

scope {
	$updated = mutate($user, {
		name = $name as PersonName or $user.name
		gender = $gender as Gender or $user.gender

		biography = $biography as $v {
			ResetValue = nil
			Text       = $v
			default    = $user.biography
		}

		avatar = $avatar as $v {
			ResetValue = nil
			Picture    = $v
			default    = $user.avatar
		}

		email = $email as EmailAddress or $user.email

		phone = $phone as $v {
			ResetValue  = nil
			PhoneNumber = $v
			default     = $user.phone
		}
	
		birthDate = $birthDate as $v {
			ResetValue = nil
			Time       = $v
			default    = $user.birthDate
		}
	
		residence = $residence as $v {
			ResetValue = nil
			City       = $v
			default    = $user.residence
		}
		
		spokenLanguages = $spokenLanguages as
			SpokenLanguages or $user.spokenLanguages
		
		access = $access as ProfileAccessPermissions or $user.access
	})
}

results {
	user User = $updated
}

# UpdateUser is accessible to the profile owner only
access UpdateUser {
	allow User as $accessor if $accessor == $user
}
