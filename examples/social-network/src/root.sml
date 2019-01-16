model SocialNetwork

root SocialNetwork {
	# trendingPublicPosts lists all currently trending public posts sorted by
	# the number of reactions
	trendingPublicPosts -> []Post as posts {
		sort   desc posts.reactions:length
		filter posts.access == Visibility(Public) &&
			posts.publication >= (now - day * 7) &&
			posts.archived == null
	}

	admins -> []Admin

	adminActivities []AdminActivity as adminActivity {
		sort desc adminActivity.time
	}

	users -> []User

	countries -> []Country

	cities -> []City

	organizations -> []Organization

	reactions -> []Reactions

	posts -> []Post
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
		if *accessor == *accessed.author
	}
}
