component display="Post" accessors="true" {

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
		var sql = "
			SELECT
				id,
				title,
				slug,
				description,
				body,
				created,
				last_updated
			FROM Post
			WHERE id = :id
		";
		var params = { "id" : { cfsqltype : "cf_sql_varchar", value : arguments.id } };
		var post   = queryExecute( sql, params );

		if ( post.recordCount ) {
			setId( post.id );
			setTitle( post.title );
			setSlug( post.slug );
			setDescription( post.description );
			setBody( post.body );
			setCreated( post.created );
			setLast_updated( post.last_updated );
		}
	}

}
