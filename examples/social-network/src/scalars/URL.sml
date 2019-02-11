# URL represents a uniform resource locator
scalar SocialNetwork::URL

use {
	"std" 1.0
}

extends Text

regex /^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/
