use {
	"std" 1.0
}

# ActivateAccount activates an account
transaction socialNetwork::ActivateAccount (
	$account          ID<User>,
	$activationSecret AsciiString,
)

errors ActivateAccount {
	// # ActivationSecretInvalid is returned if the provided activation secret
	// # is invalid
	// ActivationSecretInvalid if ...

	// # ActivationSecretExpired is returned if the provided activation secret
	// # is expired
	// ActivationSecretExpired if ...
}

access ActivateAccount {
	allow User as $accessor if $accessor == $account
}
