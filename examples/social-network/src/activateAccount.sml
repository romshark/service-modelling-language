model SocialNetwork

# ActivateAccount activates an account
transact ActivateAccount(
	account          *User
	activationSecret String
)

# ErrActivationSecretInvalid represents an activation secret validation error
error ErrActivationSecretInvalid {}

# ErrActivationSecretExpired represents an activation secret expiration error
error ErrActivationSecretExpired {
	expiration Time
}

errors ActivateAccount {
	# ErrActivationSecretInvalid is returned if the provided activation secret
	# is invalid
	ErrActivationSecretInvalid

	# ErrActivationSecretExpired is returned if the provided activation secret
	# is expired
	ErrActivationSecretExpired
}

access ActivateAccount as accessed {
	allow User as accessor {
		*accessor == accessed.account
	}
}
