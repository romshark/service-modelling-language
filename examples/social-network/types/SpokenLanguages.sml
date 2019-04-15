type socialNetwork::SpokenLanguages = Array<Language>

errors {
	Error("SpokenLanguages must list at least one language") if
		len(this) < 1
	Error("duplicate language entry") if
		any(this, ($l) => len(filter(this, ($x) => $x == $l)) > 0)
}
