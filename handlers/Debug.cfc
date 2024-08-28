component extends="coldbox.system.EventHandler" {

	property name="BCrypt" inject="@BCrypt";

	function index( event, rc, prc ){
		writeDump( var = client, abort = 1 );
	}

	function verify( event, rc, prc ){
		writeDump(
			var   = BCrypt.checkPassword( rc.str, "$2a$12$bG3i2YlISrzEkRqlrOkdBeKNewPOi1zjkcY1xpXk6HrVG1FUIkflm" ),
			abort = 1
		);
	}

}
