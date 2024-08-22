component extends="coldbox.system.EventHandler" {

	/**
	 * Default Action
	 */
	function index( event, rc, prc ){
		prc.welcomeMessage = "Welcome to ColdBox!";
		event.setView( "main/index" );
	}

	/**
	 * Produce some restfulf data
	 */
	function data( event, rc, prc ){
		var post = getInstance( "Post" );
		post.getPostById( "a768aa70-5ff7-11ef-b36c-9a6c4d3d4dca" );

		writeDump( var = post.getMemento(), abort = 1 );
		writeDump( var = "bottom of method", abort = 1 );
	}

	/**
	 * Relocation example
	 */
	function doSomething( event, rc, prc ){
		relocate( "main.index" );
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
