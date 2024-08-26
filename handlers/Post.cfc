component extends="coldbox.system.EventHandler" {

	property name="wirebox"     inject="wirebox";
	property name="processor"   inject="Processor@cbmarkdown";
	property name="PostService" inject;

	function index( event, rc, prc ){
		var post = wirebox
			.getInstance( "QueryBuilder@qb" )
			.from( "Post" )
			.select( [
				"title",
				"slug",
				"description",
				"cover_image",
				"created",
				"last_updated",
				"publish_date",
				"body"
			] )
			.whereRaw(
				"YEAR(publish_date) = ? AND MONTH(publish_date) = ? AND slug = ?",
				[ int( rc.year ), int( rc.month ), rc.slug ]
			)
			.get();

		if ( isArray( post ) and len( post ) ) {
			prc.post = post[ 1 ];
		}

		prc.rendered = processor.toHtml( prc.post.body );

		event.setView( "post/index" );
	}

}
