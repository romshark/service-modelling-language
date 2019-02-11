entity SocialNetwork::Post

use {
	"std" 1.0
}

properties {
	collection  <-> Posts.all
	publication Time
	content     Text
	access      VisibilityPermission
	reactions   Reactions

	# archived specifies the time the post was removed. This field is nil when
	# the post was not removed
	archived ?Time
}

# Posts are either public, only accessible to the friends of a user, to a
# whitelist of friends or to all friends except the blacklisted ones
access Post {
	allow Admin
	allow User as $accessor if (
		select typeof(this.collection:entity) as $v {
			case User         = $accessor == $v
			case Organization = true
		}
	) || select typeof(this.access) as $v {
			case Visibility = select $v {
				case Visibility::public  = true
				case Visibility::friends = $accessor in this.friends
			}
			case VisibilityBlacklist = $accessor !in this.access
			case VisibilityWhitelist = $accessor in this.access
		}
}
