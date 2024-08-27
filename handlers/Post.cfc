component extends="coldbox.system.EventHandler" {

	property name="wirebox"   inject="wirebox";
	property name="processor" inject="Processor@cbmarkdown";


	function index( event, rc, prc ){
		var post = {};
		var bean = wirebox.getInstance( "Post" );
		post     = bean.getByRouteParams( rc ).getMemento();
		if ( !post.id.len() ) location( "/", false );
		prc.post     = post;
		prc.rendered = processor.toHtml( prc.post.body );
		event.setView( "post/index" );
	}

}
