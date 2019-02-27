# Relationship represents a relationship between two users or just a name of the
# partner
struct SocialNetwork::Relationship

properties {
	type RelationshipType

	# partner either represents a user registered in the network or just a name
	# of a person that's not registered on the network
	partner ?(PersonName or User)
}
