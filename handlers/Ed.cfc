component extends="coldbox.system.EventHandler" {

	property name="processor"   inject="Processor@cbmarkdown";
	property name="PostService" inject;

	function preHandler( event, rc, prc, action, eventArguments ){
		if ( action == "index" ) return;
	}

	/**
	 * index handler
	 *
	 * @event
	 * @rc   
	 * @prc  
	 */
	function index( event, rc, prc ){
		prc.drafts    = PostService.listDraftPosts();
		prc.published = PostService.listPublishedPosts();
	}

	/**
	 * view a post by id
	 *
	 * @event
	 * @rc   
	 * @prc  
	 */
	function view( event, rc, prc ){
		var post          = getInstance( "Post" );
		prc[ "id" ]       = event.getValue( "id", "" );
		prc[ "post" ]     = post.getById( prc.id ).getMemento();
		prc[ "rendered" ] = processor.toHtml( post.getBody() );
	}

	/**
	 * edit a post
	 *
	 * @event
	 * @rc   
	 * @prc  
	 */
	function edit( event, rc, prc ){
		var post      = getInstance( "Post" );
		prc[ "id" ]   = event.getValue( "id", "" );
		prc[ "post" ] = post.getById( prc.id ).getMemento();
	}

	/**
	 * save a post
	 *
	 * @event
	 * @rc   
	 * @prc  
	 */
	function save( event, rc, prc ){
		var post = populateModel( "Post" );
		post.save();
		relocate( "/ed" );
	}

}
