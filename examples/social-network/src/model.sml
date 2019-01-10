model SocialNetwork

model SocialNetwork {
	# trendingPublicPosts lists all currently trending public posts sorted by
	# the number of reactions
	trendingPublicPosts []Post {
		sort   desc Post.reactions:length
		filter Post.access == Visibility(Public) &&
			Post.publication >= (now - day * 7) &&
			Post.archived == null
	}

	admins []Admin

	adminActivities []AdminActivity {
		sort desc AdminActivity.time
	}

	users []User

	countries []Country

	cities []City

	organizations []Organization

	reactions []Reactions

	posts []Post
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
