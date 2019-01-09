model SocialNetwork

scalar EmailAddress extend Text {
	regex /.+@.+\..+/
}

# URL represents a uniform resource locator
scalar URL {
	
}
