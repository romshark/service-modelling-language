use {
	"std/regexp" 1.0
}

type socialNetwork::AsciiString = Array<Byte>

new -> ?Error = match {
	!regex::match(this, /[ -~]+/) then Error("invalid charset")
}
