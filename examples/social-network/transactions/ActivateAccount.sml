use {
	"std" 1.0
}

# ActivateAccount activates an account
transaction socialNetwork::ActivateAccount {
	$account          ID<User>
	$activationSecret String
}

errors ActivateAccount {
	// # ActivationSecretInvalid is returned if the provided activation secret
	// # is invalid
	// Error<ActivationSecretInvalid> if

	// # ActivationSecretExpired is returned if the provided activation secret
	// # is expired
	// Error<ActivationSecretExpired> if
}

access ActivateAccount {
	allow User as $accessor if $accessor == $account
}
