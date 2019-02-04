# ProfileAccessPermissionsForm bundles all user profile access permissions
struct SocialNetwork::ProfileAccessPermissionsForm

properties {
	profile             VisibilityPermissionForm
	email               VisibilityPermissionForm
	phone               VisibilityPermissionForm
	birthDate           VisibilityPermissionForm
	residence           VisibilityPermissionForm
}
