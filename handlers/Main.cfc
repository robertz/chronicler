component extends="coldbox.system.EventHandler" {

	property name="PostService" inject;

	/**
	 * Default Action
	 */
	function index( event, rc, prc ){
		prc.posts    = PostService.listPublishedPosts( maxrows = 4 );
		prc.trending = PostService.getTrending( maxrows = 3 );
		prc.mostRead = PostService.getMostRead( maxrows = 3 );
	}

	function latest( event, rc, prc ){
		prc.page     = rc.keyExists( "page" ) && isNumeric( rc.page ) && rc.page > 0 ? rc.page : 1;
		prc.mostRead = PostService.getMostRead( maxrows = 3 );
		prc.posts    = PostService.listPublishedPosts( maxrows = 6, page = prc.page );
	}

	/**
	 * --------------------------------------------------------------------------
	 * Implicit Actions
	 * --------------------------------------------------------------------------
	 * All the implicit actions below MUST be declared in the config/Coldbox.cfc in order to fire.
	 * https://coldbox.ortusbooks.com/getting-started/configuration/coldbox.cfc/configuration-directives/coldbox#implicit-event-settings
	 */

	function onAppInit( event, rc, prc ){
	}

	function onRequestStart( event, rc, prc ){
	}

	function onRequestEnd( event, rc, prc ){
	}

	function onSessionStart( event, rc, prc ){
	}

	function onSessionEnd( event, rc, prc ){
		var sessionScope     = event.getValue( "sessionReference" );
		var applicationScope = event.getValue( "applicationReference" );
	}

	function onException( event, rc, prc ){
		event.setHTTPHeader( statusCode = 500 );
		// Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		// Place exception handler below:
	}

}
