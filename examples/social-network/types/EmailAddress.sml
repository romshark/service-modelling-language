use {
	"std/regexp" 1.0
}

type socialNetwork::EmailAddress = Text

new -> ?Error = match {
	!regexp::match(this, /.+@.+\..+/) then
		Error(`invalid email address ($(this))`)
}
