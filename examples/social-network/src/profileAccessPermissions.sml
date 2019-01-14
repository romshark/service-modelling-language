model SocialNetwork

# ProfileAccessPermissions bundles all user profile access permissions
struct ProfileAccessPermissions {
	profile   VisiblityPermission
	email     VisiblityPermission
	phone     VisiblityPermission
	birthDate VisiblityPermission
	residence VisiblityPermission
}
