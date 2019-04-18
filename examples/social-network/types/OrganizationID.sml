use {
	"std/regexp" 1.0
}

type socialNetwork::OrganizationID = Array<Byte>

new -> ?Error = match {
	!match(this, /[a-z0-9][a-z0-9]+/) then Error("invalid charset")
}
