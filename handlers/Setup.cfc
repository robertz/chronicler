component extends="coldbox.system.EventHandler" {

	property name="PostService" inject;

	function index( event, rc, prc ){
		var posts = PostService.listPublishedPosts( maxrows = 0 );

		posts.each( ( post ) => {
			var p  = getInstance( "post" ).getById( post.id );
			var fn = p.getCover_image();

			if ( isValid( "url", fn ) ) {
				if ( !directoryExists( expandPath( "./media/covers/" & dateFormat( p.getPublish_Date(), "yyyy" ) ) ) ) {
					directoryCreate( expandPath( "./media/covers/" ) & dateFormat( p.getPublish_Date(), "yyyy" ) )
				}
				var out = "/media/covers/" & dateFormat( p.getPublish_Date(), "yyyy" ) & "/" & p.getSlug() & "." & fn.listLast( "." );
				cfhttp( url = fn, file = expandPath( out ) );
				p.setCover_image( out );
				p.save();
			}
		} );
		abort;
	}

}
