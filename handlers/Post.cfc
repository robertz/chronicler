component extends="coldbox.system.EventHandler" {

	property name="wirebox"     inject="wirebox";
	property name="processor"   inject="Processor@cbmarkdown";
	property name="PostService" inject;


	function index( event, rc, prc ){
		var post = {};
		var bean = wirebox.getInstance( "Post" ).getByRouteParams( rc );

		if ( !bean.getId().len() ) location( "/", false );
		bean.updateViews();
		prc.post     = bean.getMemento();
		prc.rendered = processor.toHtml( prc.post.body );

		event.setView( "post/index" );
	}

	function rss( event, rc, prc ){
		var posts = PostService.rssFeed();
		var feed  = "";
		var xml   = "";

		var colmap = {
			"id"            : "id",
			"title"         : "title",
			"publishedDate" : "publish_date",
			"content"       : "description"
		}

		cffeed(
			action     = "create",
			query      = posts,
			columnMap  = colmap,
			properties = {},
			xmlvar     = "xml"
		);

		writeDump( var = xmlParse( xml ), abort = 1 );
	}

}
