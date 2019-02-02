# VisibilityBlacklistForm is the pure version of VisibilityBlacklist used as an
# input form
struct SocialNetwork::VisibilityBlacklistForm

properties {
	users []ID<User>
}
