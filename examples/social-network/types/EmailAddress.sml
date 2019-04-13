use {
	"std/regexp" 1.0
}

type socialNetwork::EmailAddress = Text

conversion Text as $t -> EmailAddress as $v {
	$v = $t

	error = match {
		!regexp::match($t, /.+@.+\..+/) = `invalid email address ($t)`
	}
}
