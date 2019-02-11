# ActivateAccount activates an account
transaction SocialNetwork::ActivateAccount

use {
	"std" 1.0
}

parameters (
	$account          ID<User>
	$activationSecret String
)

errors ActivateAccount {
	# ErrActivationSecretInvalid is returned if the provided activation secret
	# is invalid
	ErrActivationSecretInvalid

	# ErrActivationSecretExpired is returned if the provided activation secret
	# is expired
	ErrActivationSecretExpired
}

access ActivateAccount {
	allow User as $accessor if $accessor == $account
}
