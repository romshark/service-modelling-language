type socialNetwork::PersonName = struct {
	firstName Text
	lastName  Text
}

new -> ?Error => match {
	len(this.firstName) < 2 then Error("first name too short")
	len(this.firstName) > 64 then Error("first name too long")
	len(this.lastName) < 2 then Error("last name too short")
	len(this.lastName) > 64 then Error("last name too long")
}
