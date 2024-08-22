component extends="coldbox.system.EventHandler" {

	property name="processor"   inject="Processor@cbmarkdown";
	property name="PostService" inject;

	function index( event, rc, prc ){
		prc[ "posts" ] = PostService.listPosts();
	}

	function view( event, rc, prc ){
		var post    = getInstance( "Post" );
		prc[ "id" ] = event.getValue( "id", "a768aa70-5ff7-11ef-b36c-9a6c4d3d4dca" );
		post.getById( prc.id );
		prc[ "post" ]     = post.getMemento();
		prc[ "rendered" ] = processor.toHtml( post.getBody() );
	}

	function edit( event, rc, prc ){
		var post    = getInstance( "Post" );
		prc[ "id" ] = event.getValue( "id", "a768aa70-5ff7-11ef-b36c-9a6c4d3d4dca" );
		post.getById( prc.id );
		prc[ "post" ] = post.getMemento();
	}

}
