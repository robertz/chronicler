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
				"A.display_name"
			] )
			.from( "Post P" )
			.leftJoin( "PostAuthor PA", "PA.post_id", "=", "P.id" )
			.leftJoin( "Author A", "A.id", "=", "PA.author_id" )
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
				"A.display_name"
			] )
			.from( "Post P" )
			.leftJoin( "PostAuthor PA", "PA.post_id", "=", "P.id" )
			.leftJoin( "Author A", "A.id", "=", "PA.author_id" )
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
				"A.display_name"
			] )
			.from( "Post P" )
			.leftJoin( "PostAuthor PA", "PA.post_id", "=", "P.id" )
			.leftJoin( "Author A", "A.id", "=", "PA.author_id" )
			.whereNull( "publish_date" )
			.orderBy( "created", "desc" )
			.get();
	}

	function viewPost( required struct criteria ){
		return wirebox
			.getInstance( "QueryBuilder@qb" )
			.select( [
				"P.id",
				"P.title",
				"P.slug",
				"P.description",
				"P.cover_image",
				"P.body",
				"P.created",
				"P.last_updated",
				"P.publish_date",
				"A.display_name"
			] )
			.from( "Post P" )
			.leftJoin( "PostAuthor PA", "PA.post_id", "=", "P.id" )
			.leftJoin( "Author A", "A.id", "=", "PA.author_id" )
			.whereRaw(
				"YEAR(publish_date) = ? AND MONTH(publish_date) = ? AND slug = ?",
				[
					int( criteria.year ),
					int( criteria.month ),
					criteria.slug
				]
			)
			.first();
	}

}
