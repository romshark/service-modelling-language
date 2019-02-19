# URL represents a uniform resource locator
type SocialNetwork::URL

use {
	"std" 1.0
}

value Text {
	regex: /^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/
}
