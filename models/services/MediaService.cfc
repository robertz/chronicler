component {

	/**
	 * Scans the media directory for files
	 *
	 * @return array of file objects
	 */
	function listMedia(){
		var files = directoryList(
			path     = expandPath( "/media" ),
			recurse  = true,
			filter   = "*.jpg|*.jpeg|*.png",
			listInfo = "query",
			sort     = "directory desc"
		);
		var home = expandPath( "/" );
		var out  = [];
		files.each( ( row ) => {
			out.append( {
				name      : row.name,
				imagepath : row.directory.replace( home, "" ) & "/" & row.name,
				directory : row.directory.replace( home, "" )
			} );
		} );
		return out;
	}

}
