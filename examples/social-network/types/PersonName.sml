type socialNetwork::PersonName = struct {
	firstName Text
	lastName  Text
}

conversion PersonName as $pn -> Text as $v {
	$v = $pn.firstName + " " + $pn.lastName
}

errors {
	Error("first name too short") if len(this.firstName) < 2
	Error("first name too long") if len(this.firstName) > 64
	Error("last name too short") if len(this.lastName) < 2
	Error("last name too long") if len(this.lastName) > 64
}
