component extends="coldbox.system.EventHandler" {

	property name="processor"   inject="Processor@cbmarkdown";
	property name="PostService" inject;
	property name="BCrypt"      inject="@BCrypt";

	/**
	 * handle authentication
	 *
	 * @event         
	 * @rc            
	 * @prc           
	 * @action        
	 * @eventArguments
	 */
	function preHandler( event, rc, prc, action, eventArguments ){
		// allow unauthenticated users to view index and logout
		if ( action == "index" || action == "logout" ) return;
		// if trying to view a secured action, bounce the user to login if not authenticated
		if ( !client.keyExists( "uid" ) || !client.uid.len() ) relocate( "ed" );
		// store the current user in the prc scope
		prc.oUser = getInstance( "User" ).getById( client.uid ).getMemento();
	}

	/**
	 * authentication handler
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
	 * logout the current user
	 *
	 * @event
	 * @rc   
	 * @prc  
	 */
	function logout( event, rc, prc ){
		client.delete( "uid" );
		csrfRotate();
		location( "/", false );
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
