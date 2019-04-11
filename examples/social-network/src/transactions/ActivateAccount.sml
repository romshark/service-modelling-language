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
	// ActivationSecretInvalid 

	// # ActivationSecretExpired is returned if the provided activation secret
	// # is expired
	// ActivationSecretExpired
}

access ActivateAccount {
	allow User as $accessor if $accessor == $account
}
