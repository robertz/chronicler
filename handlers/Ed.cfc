component extends="coldbox.system.EventHandler" {

	property name="processor"   inject="Processor@cbmarkdown";
	property name="PostService" inject;

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
		var post    = getInstance( "Post" );
		prc[ "id" ] = event.getValue( "id", "" );
		post.getById( prc.id );
		prc[ "post" ]     = post.getMemento();
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
		var post    = getInstance( "Post" );
		prc[ "id" ] = event.getValue( "id", "" );
		post.getById( prc.id );
		prc[ "post" ] = post.getMemento();
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
