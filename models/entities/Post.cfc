component display="Post" accessors="true" {

	property name="populator" inject="wirebox:populator";
	property name="wirebox"   inject="wirebox";

	property name="id";
	property name="title";
	property name="slug";
	property name="description";
	property name="cover_image";
	property name="body";
	property name="created";
	property name="last_updated";
	property name="publish_date";
	property name="display_name";
	property name="views";

	/**
	 * Initialize the object
	 */
	function init(){
		variables.id           = "";
		variables.title        = "";
		variables.slug         = "";
		variables.description  = "";
		variables.cover_image  = "";
		variables.body         = "";
		variables.created      = "";
		variables.last_updated = "";
		variables.publish_date = "";

		// computed
		variables.display_name = "";
		variables.views        = 0;

		return this;
	}

	/**
	 * Gets the memento for the bean
	 *
	 * @return the current memento
	 */
	function getMemento(){
		return {
			"id"           : variables.id,
			"title"        : variables.title,
			"slug"         : variables.slug,
			"description"  : variables.description,
			"cover_image"  : variables.cover_image,
			"body"         : variables.body,
			"created"      : variables.created,
			"last_updated" : variables.last_updated,
			"publish_date" : variables.publish_date,
			"display_name" : variables.display_name,
			"views"        : variables.views
		}
	}

	/**
	 * Gets the post specified by id
	 *
	 * @id guid of post to get
	 *
	 * @return current instance (for chaining)
	 */
	function getById( required string id ){
		var qb   = wirebox.getInstance( "QueryBuilder@qb" );
		var post = qb
			.from( "Post P" )
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
				"U.display_name",
				"V.views"
			] )
			.leftJoin( "UserPost UP", "UP.post_id", "=", "P.id" )
			.leftJoin( "User U", "U.id", "=", "UP.user_id" )
			.leftJoin( "Views V", "V.post_id", "=", "P.id" )
			.find( arguments.id, "P.id" );

		if ( !post.isEmpty() ) {
			populator.populateFromStruct( target = this, memento = post );
			if ( isNull( variables.views ) || !isNumeric( variables.views ) ) variables.views = 1;
		}
		return this;
	}

	/**
	 * Gets the post specified by the route parameters
	 *
	 * @criteria route parameters
	 *
	 * @return current instance (for chaining)
	 */
	function getByRouteParams( required struct criteria ){
		if ( ( !isNumeric( arguments.criteria.year ) || !isNumeric( arguments.criteria.month ) ) ) return this;
		var post = wirebox
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
				"U.display_name",
				"V.views"
			] )
			.from( "Post P" )
			.leftJoin( "UserPost UP", "UP.post_id", "=", "P.id" )
			.leftJoin( "User U", "U.id", "=", "UP.user_id" )
			.leftJoin( "Views V", "V.post_id", "=", "P.id" )
			.whereRaw(
				"YEAR(publish_date) = ? AND MONTH(publish_date) = ? AND slug = ?",
				[
					{
						value     : int( arguments.criteria.year ),
						cfsqltype : "cf_sql_integer"
					},
					{
						value     : int( arguments.criteria.month ),
						cfsqltype : "cf_sql_integer"
					},
					{
						value     : arguments.criteria.slug,
						cfsqltype : "cf_sql_varchar"
					}
				]
			)
			.first();

		if ( !post.isEmpty() ) {
			populator.populateFromStruct( target = this, memento = post );
			if ( isNull( variables.views ) || !isNumeric( variables.views ) ) variables.views = 1;
		}
		return this;
	}

	function updateViews(){
		var c = wirebox
			.getInstance( "QueryBuilder@qb" )
			.from( "Views" )
			.select( [ "views" ] )
			.where( "post_id", getId() )
			.first();

		if ( c.isEmpty() ) {
			wirebox
				.getInstance( "QueryBuilder@qb" )
				.from( "Views" )
				.insert( { post_id : getId(), views : 1 } );
		} else {
			wirebox
				.getInstance( "QueryBuilder@qb" )
				.where( "post_id", getId() )
				.from( "Views" )
				.update( { views : c.views + 1 } );
		}
		return this;
	}
	/**
	 * Persist the current bean
	 */
	function save(){
		var qb     = wirebox.getInstance( "QueryBuilder@qb" );
		var obj    = getMemento();
		var exists = len( trim( obj.id ) ) ? true : false;
		var ignore = [ "created", "last_updated", "display_name" ];

		ignore.each( ( el ) => {
			obj.delete( el );
		} );
		// handle empty values
		if ( !variables.publish_date.len() ) obj.delete( "publish_date" );
		if ( !variables.id.len() ) {
			obj.id = lCase( createGUID() );
		}

		// save
		qb.from( "Post" )
			.where( "id", obj.id )
			.updateOrInsert( obj );

		if ( !exists ) {
			// link the author to the post
			wirebox
				.getInstance( "QueryBuilder@qb" )
				.from( "UserPost" )
				.updateOrInsert( {
					post_id : obj.id,
					user_id : "cf509c38-63c0-11ef-b36c-9a6c4d3d4dca"
				} )
		}
	}

}
