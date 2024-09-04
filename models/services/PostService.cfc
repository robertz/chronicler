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
				"U.display_name",
				"V.views"
			] )
			.from( "Post P" )
			.leftJoin( "UserPost UP", "UP.post_id", "=", "P.id" )
			.leftJoin( "User U", "U.id", "=", "UP.user_id" )
			.leftJoin( "Views V", "V.post_id", "=", "P.id" )
			.orderBy( "publish_date", "desc" )
			.get();
	}

	/**
	 * Get all published, excluding the body
	 *
	 * @return array of posts
	 */
	function listPublishedPosts( maxrows = 25, page = 1 ){
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
				"U.display_name",
				"V.views"
			] )
			.from( "Post P" )
			.leftJoin( "UserPost UP", "UP.post_id", "=", "P.id" )
			.leftJoin( "User U", "U.id", "=", "UP.user_id" )
			.leftJoin( "Views V", "V.post_id", "=", "P.id" )
			.whereNotNull( "publish_date" )
			.orderBy( "publish_date", "desc" )
			.paginate( maxrows = arguments.maxrows, page = arguments.page );
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
				"U.display_name",
				"V.views"
			] )
			.from( "Post P" )
			.leftJoin( "UserPost UP", "UP.post_id", "=", "P.id" )
			.leftJoin( "User U", "U.id", "=", "UP.user_id" )
			.leftJoin( "Views V", "V.post_id", "=", "P.id" )
			.whereNull( "publish_date" )
			.orderBy( "created", "desc" )
			.get();
	}

	function getMostRead( maxrows = 3 ){
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
				"U.display_name",
				"V.views"
			] )
			.from( "Post P" )
			.leftJoin( "UserPost UP", "UP.post_id", "=", "P.id" )
			.leftJoin( "User U", "U.id", "=", "UP.user_id" )
			.leftJoin( "Views V", "V.post_id", "=", "P.id" )
			.limit( arguments.maxrows )
			.orderBy( "views", "desc" )
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
				"U.display_name",
				"V.views"
			] )
			.from( "Post P" )
			.leftJoin( "UserPost UP", "UP.post_id", "=", "P.id" )
			.leftJoin( "User U", "U.id", "=", "UP.user_id" )
			.leftJoin( "Views V", "V.post_id", "=", "P.id" )
			.whereNotNull( "publish_date" )
			.orderBy( "publish_date", "desc" )
			.get();
	}

}
