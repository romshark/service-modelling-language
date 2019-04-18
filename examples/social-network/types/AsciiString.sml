use {
	"std/regexp" 1.0
}

type socialNetwork::AsciiString = Array<Byte>

new -> ?Error = match {
	!regex::match(this, /[ -~]+/) then Error("invalid charset")
}

conversion AsciiString as $v -> Text = Text($v)
conversion Text as $v -> AsciiString = Array<Byte>($v)
