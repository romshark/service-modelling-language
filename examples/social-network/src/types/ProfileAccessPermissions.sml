# ProfileAccessPermissions bundles all user profile access permissions
type SocialNetwork::ProfileAccessPermissions

value struct {
	profile   VisibilityPermission
	email     VisibilityPermission
	phone     VisibilityPermission
	birthDate VisibilityPermission
	residence VisibilityPermission
}
