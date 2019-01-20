model SocialNetwork

root SocialNetwork {
	# trendingPublicPosts lists all currently trending public posts sorted by
	# the number of reactions
	trendingPublicPosts Entities<Post> as posts {
		sort   desc posts.reactions:length
		filter posts.access == Visibility(Public) &&
			posts.publication >= (now - day * 7) &&
			posts.archived == null
	}

	admins Entities<Admin>

	adminActivities Entities<AdminActivity> as adminActivities {
		sort desc adminActivities.time
	}

	users Entities<User>

	countries Entities<Country>

	cities Entities<City>

	organizations Entities<Organization>

	reactions Entities<Reactions>

	posts Entities<Post>

	# mutualFriends lists all mutual friends between the given users
	mutualFriends(
		target ID<User>
		friend ID<User>
	) -> []User = Math.intersection(target.friends, friend.friends)
}

access SocialNetwork {
	allow public
}

access SocialNetwork.trendingPublicPosts {
	allow public
}

# Allow only admins and authors of reactions to access them directly
access SocialNetwork.reactions as accessed {
	allow Admin
	allow User as accessor {
		if accessor == accessed.author
	}
}

# Allow users to find mutual friends between themselves and their friends only
access SocialNetwork.mutualFriends as accessed {
	allow Admin
	allow User as accessor {
		if accessor == accessed.target &&
			accessed.target in accessed.friend.friends
	}
}
