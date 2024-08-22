component extends="coldbox.system.EventHandler" {

	function index( event, rc, prc ){
		abort;
	}

	function save( event, rc, prc ){
		var post = getInstance( "Post" );
		post.getById( "a768aa70-5ff7-11ef-b36c-9a6c4d3d4dca" );


		writeDump( var = post.getMemento(), abort = 1 );
	}

}
