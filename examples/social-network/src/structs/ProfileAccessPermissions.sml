# ProfileAccessPermissions bundles all user profile access permissions
struct SocialNetwork::ProfileAccessPermissions

properties {
	profile   VisiblityPermission
	email     VisiblityPermission
	phone     VisiblityPermission
	birthDate VisiblityPermission
	residence VisiblityPermission
}
