type socialNetwork::PersonName

value struct {
	firstName Text
	lastName  Text
}

conversion PersonName as $pn -> Text {
	value = $pn.firstName + " " + $pn.lastName
}
