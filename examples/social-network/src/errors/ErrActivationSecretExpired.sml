# ErrActivationSecretExpired represents an activation secret expiration error
error SocialNetwork::ErrActivationSecretExpired

use {
	"std" 1.0
}

properties {
	expiration Time
}
