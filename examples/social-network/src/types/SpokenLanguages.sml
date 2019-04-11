type socialNetwork::SpokenLanguages = Array<Language>

constraints {
	error => match {
		len(this) < 1 = "SpokenLanguages must list at least one language"
		any(this, ($l) => len(filter(this, ($x) => $x == $l)) > 0) =
			"duplicate language entry"
	}
}
