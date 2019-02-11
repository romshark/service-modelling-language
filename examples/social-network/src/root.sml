root SocialNetwork

use {
	"std"      1.0
	"std/time" 1.0
	"std/math" 1.0
}

properties {
	# trendingPublicPosts lists all currently trending public posts sorted by
	# the number of reactions
	trendingPublicPosts []Post =
		find(Post, ($p) => $p.access == Visibility::public &&
			$p.archived == nil &&
			$p.publication >= (now - Day(7))
		) |>
		sort($, Order::Descending, Post.reactions:length)

	admins []Admin = entities(Admin)

	adminActivities []AdminActivity = entities(AdminActivity) |>
		sort($, Order::Descending, AdminActivity.time)

	users []User = entities(User)

	countries []Country = entities(Country)

	cities []City = entities(City)

	organizations []Organization = entities(Organization)

	reactions []Reactions = entities(Reactions)

	posts []Post = entities(Post)

	# mutualFriends lists all mutual friends between the given users
	mutualFriends []User (
		$target ID<User>
		$friend ID<User>
	) = intersection($target.friends, $friend.friends)
}

access {
	allow public
}

access trendingPublicPosts {
	allow public
}

# Allow only admins
access reactions {
	allow Admin
}

# Allow users to find mutual friends between themselves and their friends only
access mutualFriends as $mf {
	allow Admin
	allow User as $accessor if $accessor == $mf.$target &&
		$mf.$target in $mf.$friend.friends
}
