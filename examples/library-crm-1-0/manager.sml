model LibraryCRM

use Std    1.0
use Gender 1.2

# Manager represents a manager user profile
user Manager {
	name          PersonName
	email         EmailAddress
	gender        Gender
	registration  Time
	avatarPicture ?PictureFile
	rights        ManagerRights
}

access Manager {
	Owner
	PrimaryAdmin
}
