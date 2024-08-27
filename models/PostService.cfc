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
			.select( [
				"P.id",
				"P.title",
				"P.slug",
				"P.description",
				"P.cover_image",
				"P.created",
				"P.last_updated",
				"P.publish_date",
				"U.display_name"
			] )
			.from( "Post P" )
			.leftJoin( "UserPost UP", "UP.post_id", "=", "P.id" )
			.leftJoin( "User U", "U.id", "=", "UP.user_id" )
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
			.select( [
				"P.id",
				"P.title",
				"P.slug",
				"P.description",
				"P.cover_image",
				"P.created",
				"P.last_updated",
				"P.publish_date",
				"U.display_name"
			] )
			.from( "Post P" )
			.leftJoin( "UserPost UP", "UP.post_id", "=", "P.id" )
			.leftJoin( "User U", "U.id", "=", "UP.user_id" )
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
			.select( [
				"P.id",
				"P.title",
				"P.slug",
				"P.description",
				"P.cover_image",
				"P.created",
				"P.last_updated",
				"P.publish_date",
				"U.display_name"
			] )
			.from( "Post P" )
			.leftJoin( "UserPost UP", "UP.post_id", "=", "P.id" )
			.leftJoin( "User U", "U.id", "=", "UP.user_id" )
			.whereNull( "publish_date" )
			.orderBy( "created", "desc" )
			.get();
	}

	/**
	 * Get all published, excluding the body
	 *
	 * @return array of posts
	 */
	function rssFeed(){
		return wirebox
			.getInstance( "QueryBuilder@qb" )
			.setReturnFormat( "query" )
			.select( [
				"P.id",
				"P.title",
				"P.slug",
				"P.description",
				"P.cover_image",
				"P.created",
				"P.last_updated",
				"P.publish_date",
				"U.display_name"
			] )
			.from( "Post P" )
			.leftJoin( "UserPost UP", "UP.post_id", "=", "P.id" )
			.leftJoin( "User U", "U.id", "=", "UP.user_id" )
			.whereNotNull( "publish_date" )
			.orderBy( "publish_date", "desc" )
			.get();
	}

}
