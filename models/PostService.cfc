component {

	property name="wirebox" inject="wirebox";

	/**
	 * Get data for posts, excluding the body
	 *
	 * @return array of posts
	 */
	function listPosts(){
		return wirebox
			.getInstance( "QueryBuilder@qb" )
			.from( "Post" )
			.select( [
				"id",
				"title",
				"slug",
				"description",
				"created",
				"last_updated"
			] )
			.orderBy( "created", "desc" )
			.get();
	}

}
