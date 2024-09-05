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
			.subSelect( "tags", function( q ){
				q.selectRaw( "GROUP_CONCAT(T.tag)" )
					.from( "TagPost TP" )
					.join( "Tag T", "T.id", "=", "TP.tag_id" )
					.whereColumn( "TP.post_id", "P.id" )
			} )
			.orderBy( "publish_date", "desc" )
			.get();
	}

	/**
	 * Get all published, excluding the body
	 *
	 * @return array of posts
	 */
	function listPublishedPosts( maxrows = 25, page = 1 ){
		var q = wirebox
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
			.subSelect( "tags", function( q ){
				q.selectRaw( "GROUP_CONCAT(T.tag)" )
					.from( "TagPost TP" )
					.join( "Tag T", "T.id", "=", "TP.tag_id" )
					.whereColumn( "TP.post_id", "P.id" )
			} )
			.whereNotNull( "publish_date" )
			.orderBy( "publish_date", "desc" );

		if ( arguments.maxrows == 0 ) return q.get();
		return q.paginate( maxrows = arguments.maxrows, page = arguments.page );
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
			.subSelect( "tags", function( q ){
				q.selectRaw( "GROUP_CONCAT(T.tag)" )
					.from( "TagPost TP" )
					.join( "Tag T", "T.id", "=", "TP.tag_id" )
					.whereColumn( "TP.post_id", "P.id" )
			} )
			.whereNull( "publish_date" )
			.orderBy( "created", "desc" )
			.get();
	}

	/**
	 * returns an array of posts sorted by the number of views descending
	 *
	 * @maxrows number of results to return
	 *
	 * @return array of posts
	 */
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
			.subSelect( "tags", function( q ){
				q.selectRaw( "GROUP_CONCAT(T.tag)" )
					.from( "TagPost TP" )
					.join( "Tag T", "T.id", "=", "TP.tag_id" )
					.whereColumn( "TP.post_id", "P.id" )
			} )
			.limit( arguments.maxrows )
			.orderBy( "views", "desc" )
			.get();
	}

	/**
	 * returns the most recently read articles
	 *
	 * @maxrows number of results to return
	 *
	 * @return array of posts
	 */
	function getTrending( maxrows = 3 ){
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
			.from( "Views V" )
			.leftJoin( "Post P", "P.id", "=", "V.post_id" )
			.leftJoin( "UserPost UP", "UP.post_id", "=", "P.id" )
			.leftJoin( "User U", "U.id", "=", "UP.user_id" )
			.subSelect( "tags", function( q ){
				q.selectRaw( "GROUP_CONCAT(T.tag)" )
					.from( "TagPost TP" )
					.join( "Tag T", "T.id", "=", "TP.tag_id" )
					.whereColumn( "TP.post_id", "P.id" )
			} )
			.whereRaw( "V.last_viewed >= DATE(NOW() - INTERVAL 7 DAY)" )
			.limit( arguments.maxrows )
			.orderBy( "V.last_viewed", "desc" )
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
