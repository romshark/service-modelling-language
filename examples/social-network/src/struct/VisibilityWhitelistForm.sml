# VisibilityWhitelistForm is the pure version of VisibilityBlacklist used as an
# input form
struct SocialNetwork::VisibilityWhitelistForm

properties {
	users []ID<User>
}
