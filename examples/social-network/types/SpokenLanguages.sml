type socialNetwork::SpokenLanguages = Array<Language>

new -> ?Error = match {
	len(this) < 1 then
		Error("SpokenLanguages must list at least one language")
	any(this, ($l) => len(filter(this, ($x) => $x == $l)) > 0) then
		Error("duplicate language entry")
}
