component extends="coldbox.system.EventHandler" {

	property name="wirebox"     inject="wirebox";
	property name="processor"   inject="Processor@cbmarkdown";
	property name="PostService" inject;

	function index( event, rc, prc ){
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
				"A.display_name"
			] )
			.from( "Post P" )
			.leftJoin( "PostAuthor PA", "PA.post_id", "=", "P.id" )
			.leftJoin( "Author A", "A.id", "=", "PA.author_id" )
			.whereRaw(
				"YEAR(publish_date) = ? AND MONTH(publish_date) = ? AND slug = ?",
				[ int( rc.year ), int( rc.month ), rc.slug ]
			)
			.get();

		if ( isArray( post ) and len( post ) ) {
			prc.post = post[ 1 ];
		} else {
			location( "/", false );
		}

		prc.rendered = processor.toHtml( prc.post.body );

		event.setView( "post/index" );
	}

}
