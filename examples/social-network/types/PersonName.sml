type socialNetwork::PersonName = struct {
	firstName Text
	lastName  Text
}

conversion PersonName as $pn -> Text as $v {
	$v = $pn.firstName + " " + $pn.lastName
}

constraints {
	error => match {
		len(this.firstName) < 2  = `first name too short`
		len(this.firstName) > 64 = `first name too long`
		len(this.lastName) < 2   = `last name too short`
		len(this.lastName) > 64  = `last name too long`
	}
}
