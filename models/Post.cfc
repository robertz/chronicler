component display="Post" accessors="true" {

	property name="wirebox" inject="wirebox";

	property name="id"           type="string";
	property name="title"        type="string";
	property name="slug"         type="string";
	property name="description"  type="string";
	property name="body"         type="string";
	property name="created"      type="timestamp";
	property name="last_updated" type="timestamp";

	/**
	 * Gets the memento for the bean
	 *
	 * @return the current memento
	 */
	function getMemento(){
		var post = {
			"id"           : getId(),
			"title"        : getTitle(),
			"slug"         : getSlug(),
			"description"  : getDescription(),
			"body"         : getBody(),
			"created"      : getCreated(),
			"last_updated" : getLast_updated()
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
		var post = qb.from( "Post" ).find( arguments.id );
		if ( !post.isEmpty() ) {
			wirebox.getObjectPopulator().populateFromStruct( target = this, memento = post );
		}
	}

	/**
	 * Persist the current bean
	 */
	function save(){
		var qb = wirebox.getInstance( "QueryBuilder@qb" );
		qb.from( "Post" )
			.where( "id", getId() )
			.updateOrInsert( {
				"title"       : getTitle(),
				"slug"        : getSlug(),
				"description" : getDescription(),
				"body"        : getBody()
			} );
	}

}
