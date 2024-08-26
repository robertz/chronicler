component extends="coldbox.system.EventHandler" {

	property name="wirebox"     inject="wirebox";
	property name="processor"   inject="Processor@cbmarkdown";
	property name="PostService" inject;

	function index( event, rc, prc ){
		var error = false;
		var post  = {};
		if ( !rc.keyExists( "year" ) || !isNumeric( rc.year ) ) error = true;
		if ( !rc.keyExists( "month" ) || !isNumeric( rc.month ) ) error = true;
		if ( !error ) post.append( PostService.viewPost( rc ) );
		if ( post.isEmpty() ) location( "/", false );
		prc.post     = post;
		prc.rendered = processor.toHtml( prc.post.body );
		event.setView( "post/index" );
	}

}
