# URL represents a uniform resource locator
type SocialNetwork::URL

value Text {
	regex: /^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/
}
