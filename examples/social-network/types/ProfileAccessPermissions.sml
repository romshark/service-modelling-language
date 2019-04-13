# ProfileAccessPermissions bundles all user profile access permissions
type socialNetwork::ProfileAccessPermissions = struct {
	profile   VisibilityPermission
	email     VisibilityPermission
	phone     VisibilityPermission
	birthDate VisibilityPermission
	residence VisibilityPermission
}
