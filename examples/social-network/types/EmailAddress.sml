use {
	"std/regexp" 1.0
}

type socialNetwork::EmailAddress = Text

conversion Text as $t -> EmailAddress as $v {
	$v = $t
}

errors {
	Error(`invalid email address ($t)`) if !regexp::match(this, /.+@.+\..+/)
}
