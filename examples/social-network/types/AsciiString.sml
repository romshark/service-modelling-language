use {
	"std/regexp" 1.0
}

type socialNetwork::AsciiString = Array<Byte>

conversion AsciiString as $v -> Text => Text($v)
conversion Text as $v -> AsciiString => Array<Byte>($v)

errors {
	Error("invalid charset") if !regex::match(this, /[ -~]+/)
}
