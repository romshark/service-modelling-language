type socialNetwork::PersonName = struct {
	firstName Text
	lastName  Text
}

conversion PersonName as $pn -> Text as $v {
	$v = $pn.firstName + " " + $pn.lastName
}
