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

		return this;
	}

	/**
	 * Gets the memento for the bean
	 *
	 * @return the current memento
	 */
	function getMemento(){
		var post = {
			"id"           : variables.id,
			"title"        : variables.title,
			"slug"         : variables.slug,
			"description"  : variables.description,
			"cover_image"  : variables.cover_image,
			"body"         : variables.body,
			"created"      : variables.created,
			"last_updated" : variables.last_updated,
			"publish_date" : variables.publish_date,
			"display_name" : variables.display_name
		}
		return post;
	}

	/**
	 * Gets the post specified by id
	 *
	 * @id guid of post to get
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
				"A.display_name"
			] )
			.leftJoin( "PostAuthor PA", "PA.post_id", "=", "P.id" )
			.leftJoin( "Author A", "A.id", "=", "PA.author_id" )
			.find( arguments.id, "P.id" );

		if ( !post.isEmpty() ) {
			populator.populateFromStruct( target = this, memento = post );
		}
	}

	/**
	 * Persist the current bean
	 */
	function save(){
		var qb     = wirebox.getInstance( "QueryBuilder@qb" );
		var obj    = getMemento();
		var ignore = [ "created", "last_updated" ];
		ignore.each( ( el ) => {
			obj.delete( el );
		} );
		// handle empty values
		if ( !variables.publish_date.len() ) obj.delete( "publish_date" );
		if ( !variables.id.len() ) obj.delete( "id" );
		// save
		qb.from( "Post" )
			.where( "id", obj.id ?: "" )
			.updateOrInsert( obj );
	}

}
