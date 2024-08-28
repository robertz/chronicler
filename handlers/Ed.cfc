component extends="coldbox.system.EventHandler" {

	property name="processor"   inject="Processor@cbmarkdown";
	property name="PostService" inject;
	property name="BCrypt"      inject="@BCrypt";

	function preHandler( event, rc, prc, action, eventArguments ){
		if ( action == "index" ) return;

		if ( !client.keyExists( "uid" ) || !client.uid.len() ) relocate( "ed" );
	}

	/**
	 * index handler
	 *
	 * @event
	 * @rc   
	 * @prc  
	 */
	function index( event, rc, prc ) allowedMethod="GET,POST"{
		prc.errors = [];
		if ( event.getHTTPMethod() == "POST" ) {
			if ( csrfVerify( rc.token ) ) {
				var user = getInstance( "User" );
				user.getByEmail( rc.user );
				if ( BCrypt.checkPassword( rc.pass, user.getPassword() ) ) {
					client.uid = user.getId();
					csrfRotate();
					relocate( "ed.dashboard" );
				}
			} else {
				relocate( "ed" );
			}
		}
		if ( client.keyExists( "uid" ) && client.uid.len() ) relocate( "ed.dashboard" );
		prc.token = csrfToken();
	}

	/**
	 * dashboard
	 *
	 * @event
	 * @rc   
	 * @prc  
	 */
	function dashboard( event, rc, prc ){
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
