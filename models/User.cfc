component display="User" accessors="true" {

	property name="populator" inject="wirebox:populator";
	property name="wirebox"   inject="wirebox";

	property name="id";
	property name="display_name";
	property name="email";
	property name="password";

	function init(){
		variables.id           = "";
		variables.display_name = "";
		variables.email        = "";
		variablews.password    = "";
		return this;
	}

	function getMemento(){
		return {
			"id"           : variables.id,
			"display_name" : variables.display_name,
			"email"        : variables.email,
			"password"     : variables.password
		}
	}

	function getByEmail( required string email ){
		var qb   = wirebox.getInstance( "QueryBuilder@qb" );
		var user = qb
			.from( "User" )
			.where( "email", arguments.email )
			.first()

		if ( !user.isEmpty() ) {
			populator.populateFromStruct( target = this, memento = user );
		}
		return this;
	}

}
