# UpdateUser updates a user profile changing the given fields
transaction socialNetwork::UpdateUser

use {
	"std"      1.0
	"std/time" 1.0
}

parameters {
	$user User

	$name            ?PersonName
	$gender          ?Gender
	$biography       ?Text
	$avatar          ?Picture
	$email           ?EmailAddress
	$phone           ?PhoneNumber
	$birthDate       ?Time
	$residence       ?City
	$spokenLanguages ?Array<Language>
	$access          ?ProfileAccessPermissions
}

scope {
	$updated = mutate($user, {
		name = typeof $name as $v {
			PersonName = $v
			default = $user.name
		}

		gender = typeof $gender as $v {
			Gender = $v
			default = $user.gender
		}

		biography = typeof $biography as $v {
			Text = $v
			default = $user.biography
		}

		avatar = typeof $avatar as $v {
			Picture = $v
			default = $user.avatar
		}

		email = typeof $email as $v {
			EmailAddress = $v
			default = $user.email
		}

		phone = typeof $phone as $v {
			PhoneNumber = $v
			default = $user.phone
		}
	
		birthDate = typeof $birthDate as $v {
			Time = $v
			default = $user.birthDate
		}
	
		residence = typeof $residence as $v {
			City = $v
			default = $user.residence
		}
		
		spokenLanguages = typeof $spokenLanguages as $v {
			Array<Language> = $v
			default = $user.spokenLanguages
		}
		
		access = typeof $access as $v {
			ProfileAccessPermissions = $v
			default = $user.access
		}
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
	require => typeof $spokenLanguages as $v {
		Array<Language> = len($spokenLanguages) > 0
		default = true
	}

	require => typeof $name as $v {
		PersonName = match {
			len($v.firstName) < 2  = `first name too short`
			len($v.lastName) < 2   = `last name too short`
			len($v.firstName) > 64 = `first name too long`
			len($v.lastName) > 64  = `last name too long`
		}
		default = true
	}
}