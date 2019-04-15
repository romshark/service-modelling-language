use {
	"std/regexp" 1.0
}

type socialNetwork::EmailAddress = Text

conversion Text as $v -> EmailAddress => $v

errors {
	Error(`invalid email address ($(this))`) if
		!regexp::match(this, /.+@.+\..+/)
}
