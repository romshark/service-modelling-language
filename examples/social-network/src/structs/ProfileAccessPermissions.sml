# ProfileAccessPermissions bundles all user profile access permissions
struct SocialNetwork::ProfileAccessPermissions

properties {
	profile   VisibilityPermission
	email     VisibilityPermission
	phone     VisibilityPermission
	birthDate VisibilityPermission
	residence VisibilityPermission
}
