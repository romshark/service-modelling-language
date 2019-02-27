# ErrActivationSecretExpired represents an activation secret expiration error
error SocialNetwork::ErrActivationSecretExpired

use {
	"std/time" 1.0
}

properties {
	expiration Time
}
