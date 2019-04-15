use {
	"std" 1.0
}

type socialNetwork::Text = Text

errors {
	Error("text must not be empty") if
		len(this) < 1
}

conversion socialNetwork::Text as $v -> Text => $v
conversion Text as $v -> socialNetwork::Text => $v
