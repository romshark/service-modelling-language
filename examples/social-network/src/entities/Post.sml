entity SocialNetwork::Post

use {
	"std"      1.0
	"std/time" 1.0
}

properties {
	publisher   (User or Organization)
	publication Time
	content     Text
	access      VisibilityPermission

	reactions Reactions {
		source: this
	}

	# archived specifies the time the post was removed. This field is nil when
	# the post was not removed
	archived ?Time
}

# Posts are either public, only accessible to the friends of a user, to a
# whitelist of friends or to all friends except the blacklisted ones
access Post {
	allow Admin
	allow User as $accessor if select typeof(this.publisher) {
		case User         = $accessor == this.publisher
		case Organization = true
		default           = false
	} or select typeof(this.access) {
		case Visibility = select this.access {
			case Visibility::public  = true
			case Visibility::friends = $accessor in this.friends
		}
		case VisibilityBlacklist = $accessor !in this.access
		case VisibilityWhitelist = $accessor in this.access
	}
}
