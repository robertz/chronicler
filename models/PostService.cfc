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
				"cover_image",
				"created",
				"last_updated",
				"publish_date"
			] )
			.orderBy( "publish_date", "desc" )
			.get();
	}

	/**
	 * Get all published, excluding the body
	 *
	 * @return array of posts
	 */
	function listPublishedPosts(){
		return wirebox
			.getInstance( "QueryBuilder@qb" )
			.from( "Post" )
			.select( [
				"id",
				"title",
				"slug",
				"description",
				"cover_image",
				"created",
				"last_updated",
				"publish_date"
			] )
			.whereNotNull( "publish_date" )
			.orderBy( "publish_date", "desc" )
			.get();
	}

	/**
	 * Get all draft posts, excluding the body
	 *
	 * @return array of posts
	 */
	function listDraftPosts(){
		return wirebox
			.getInstance( "QueryBuilder@qb" )
			.from( "Post" )
			.select( [
				"id",
				"title",
				"slug",
				"description",
				"cover_image",
				"created",
				"last_updated",
				"publish_date"
			] )
			.whereNull( "publish_date" )
			.orderBy( "created", "desc" )
			.get();
	}

}
