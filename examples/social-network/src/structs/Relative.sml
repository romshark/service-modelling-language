# Relative represents a relation between two users or just a relative's name
struct SocialNetwork::Relative

properties {
	type RelativeType

	# relative either represents a user registered in the network or just a name
	# of a person that's not registered on the network
	relative Relative
}