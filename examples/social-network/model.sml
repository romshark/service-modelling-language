model SocialNetwork

model SocialNetwork {

}

# trendingPublicPosts lists all currently trending public posts sorted by the
# number of reactions
root trendingPublicPosts []Post {
	sort   desc Post.reactions:length
	filter Post.access == Visibility(Public) &&
		Post.publication >= (now - day * 7) &&
		Post.archived == null
}

access trendingPublicPosts public
