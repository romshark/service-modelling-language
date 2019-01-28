root SocialNetwork

properties {
	# trendingPublicPosts lists all currently trending public posts sorted by
	# the number of reactions
	trendingPublicPosts -> []Post = entities Post |>
		filter (p) => p.access == Visibility::public &&
			p.archived == null &&
			p.publication >= (now - Std::Day(7)) |>
		sort desc Post.reactions:length

	admins -> []Admin = entities Admin

	adminActivities -> []AdminActivity = entities AdminActivity |>
		sort desc AdminActivity.time

	users -> []User = entities User

	countries -> []Country = entities Country

	cities -> []City = entities City

	organizations -> []Organization = entities Organization

	reactions -> []Reactions = entities Reactions

	posts -> []Post = entities Post

	# mutualFriends lists all mutual friends between the given users
	mutualFriends -> []User (
		$target ID<User>
		$friend ID<User>
	) = intersection $target.friends $friend.friends
}

access {
	allow public
}

access trendingPublicPosts {
	allow public
}

# Allow only admins and authors of reactions to access them directly
access reactions {
	allow Admin
	allow User as accessor {
		if accessor == properties::author
	}
}

# Allow users to find mutual friends between themselves and their friends only
access mutualFriends as mf {
	allow Admin
	allow User as accessor {
		if accessor == mf.target && mf.target in mf.friend.friends
	}
}
