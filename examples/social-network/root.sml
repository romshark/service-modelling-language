use {
	"std"      1.0
	"std/time" 1.0
	"std/math" 1.0
}

root SocialNetwork {
	# trendingPublicPosts lists all currently trending public posts sorted by
	# the number of reactions
	trendingPublicPosts Collection<Post> {
		predicate: ($p) => $p.access == Visibility::public and
			$p.archived == nil and
			$p.publication >= time::add(now(), Day(7))
		order:   Order::desc
		orderBy: Post.reactions:length
	}

	admins Collection<Admin>

	adminActivities Collection<AdminActivity> {
		order:   Order::desc
		orderBy: AdminActivity.time
	}

	users Collection<User>

	countries Collection<Country>

	cities Collection<City>

	organizations Collection<Organization>

	reactions Collection<Reaction>

	posts Collection<Post>

	# mutualFriends lists all mutual friends between the given users
	mutualFriends (
		$target ID<User>
		$friend ID<User>
	) Array<User> = intersection($target.friends, $friend.friends)
}

access {
	allow anyone
}

access trendingPublicPosts {
	allow anyone
}

# Allow only admins
access reactions {
	allow Admin
}

# Allow users to find mutual friends between themselves and their friends only
access mutualFriends as $mf {
	allow Admin
	allow User as $accessor if $accessor == $mf.$target and
		$mf.$target in $mf.$friend.friends
}
