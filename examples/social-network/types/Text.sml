use {
	"std" 1.0
}

type socialNetwork::Text = Text

new -> ?Error => match {
	len(this) < 1 then Error("text must not be empty")
}
