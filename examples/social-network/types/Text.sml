use {
	"std" 1.0
}

type socialNetwork::Text = Text

new -> ?Error = match {
	len(this) < 1 then Error("text must not be empty")
}

conversion socialNetwork::Text as $v -> Text = $v
conversion Text as $v -> socialNetwork::Text = $v
