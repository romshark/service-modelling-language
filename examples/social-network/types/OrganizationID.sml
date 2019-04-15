use {
	"std/regexp" 1.0
}

type socialNetwork::OrganizationID = Array<Byte>

errors {
	Error("invalid charset") if !match(this, /[a-z0-9][a-z0-9]+/)
}
