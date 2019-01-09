model SocialNetwork

# ProfileAccessPermissions bundles all user profile access permissions
struct ProfileAccessPermissions {
	profile   VisiblityPermission
	email     VisiblityPermission
	phone     VisiblityPermission
	birthDate VisiblityPermission
	residence VisiblityPermission
}

relation ProfileVisibilityBlacklist:
	ProfileAccessPermissions -> []User (profile.<VisibilityBlacklist>.users)
relation ProfileVisibilityWhitelist:
	ProfileAccessPermissions -> []User (profile.<VisibilityWhitelist>.users)

relation EmailVisibilityBlacklist:
	ProfileAccessPermissions -> []User (email.<VisibilityBlacklist>.users)
relation EmailVisibilityWhitelist:
	ProfileAccessPermissions -> []User (email.<VisibilityWhitelist>.users)

relation UserPhoneVisibilityBlacklist:
	ProfileAccessPermissions -> []User (phone.<VisibilityBlacklist>.users)
relation UserPhoneVisibilityWhitelist:
	ProfileAccessPermissions -> []User (phone.<VisibilityWhitelist>.users)

relation UserBirthDateVisibilityBlacklist:
	ProfileAccessPermissions -> []User (birthDate.<VisibilityBlacklist>.users)
relation UserBirthDateVisibilityWhitelist:
	ProfileAccessPermissions -> []User (birthDate.<VisibilityWhitelist>.users)

relation UserResidenceVisibilityBlacklist:
	ProfileAccessPermissions -> []User (residence.<VisibilityBlacklist>.users)
relation UserResidenceVisibilityWhitelist:
	ProfileAccessPermissions -> []User (residence.<VisibilityWhitelist>.users)
