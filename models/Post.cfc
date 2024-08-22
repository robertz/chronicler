component display="Post" accessors="true" {

	property name="wirebox" inject="wirebox";

	property name="id"           type="string";
	property name="title"        type="string";
	property name="slug"         type="string";
	property name="description"  type="string";
	property name="body"         type="string";
	property name="created"      type="timestamp";
	property name="last_updated" type="timestamp";

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

	function getPostById( required string id ){
		var qb   = wirebox.getInstance( "QueryBuilder@qb" );
		var post = qb.from( "Post" ).findOrFail( arguments.id );
		// call setters
		if ( !post.isEmpty() ) {
			for ( key in post ) {
				local.func = "set" & key;
				variables[ local.func ]( post[ key ] );
			}
		}
	}

}
