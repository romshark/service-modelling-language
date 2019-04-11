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
	$spokenLanguages ?Array<Language>
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
			Array<Language> or $user.spokenLanguages
		
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

constraints {
	require => $spokenLanguages as {
		Array<Language> = len($spokenLanguages) > 0
		default         = true
	}

	require => $name as $v {
		PersonName = match {
			len($v.firstName) < 2  = `first name too short`
			len($v.lastName) < 2   = `last name too short`
			len($v.firstName) > 64 = `first name too long`
			len($v.lastName) > 64  = `last name too long`
		}
		default = true
	}
}