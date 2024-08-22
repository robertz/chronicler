component extends="coldbox.system.EventHandler" {

	property name="processor" inject="Processor@cbmarkdown";

	function index( event, rc, prc ){
		abort;
	}

	function view( event, rc, prc ){
		var post    = getInstance( "Post" );
		prc[ "id" ] = event.getValue( "id", "a768aa70-5ff7-11ef-b36c-9a6c4d3d4dca" );
		post.getById( prc.id );
		prc[ "post" ]     = post.getMemento();
		prc[ "rendered" ] = processor.toHtml( post.getBody() );
	}

}
