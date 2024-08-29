component display="User" accessors="true" {

	property name="populator" inject="wirebox:populator";
	property name="wirebox"   inject="wirebox";
	property name="BCrypt"    inject="@BCrypt";

	property name="id";
	property name="display_name";
	property name="email";
	property name="password";

	/**
	 * init
	 */
	function init(){
		variables.id           = "";
		variables.display_name = "";
		variables.email        = "";
		variablews.password    = "";
		return this;
	}

	/**
	 * get memento for current user
	 */
	function getMemento(){
		return {
			"id"           : variables.id,
			"display_name" : variables.display_name,
			"email"        : variables.email
		}
	}

	/**
	 * gets a user by id and populates the bean
	 *
	 * @id
	 *
	 * @return the current instance
	 */
	function getById( required string id ){
		var qb   = wirebox.getInstance( "QueryBuilder@qb" );
		var user = qb
			.from( "User" )
			.where( "id", arguments.id )
			.first()

		if ( !user.isEmpty() ) {
			populator.populateFromStruct( target = this, memento = user );
		}
		return this;
	}

	/**
	 * gets a user by email and populates the bean
	 *
	 * @email email of the user
	 *
	 * @return the current instance
	 */
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

	/**
	 * Authenticate a user
	 *
	 * @string password
	 *
	 * @return boolean
	 */
	function authenticate( required string password ){
		return BCrypt.checkPassword( arguments.password, getPassword() )
	}

	/**
	 * determines if the user has been loaded
	 *
	 * @return boolean
	 */
	function hasLoaded(){
		return len( getId() ) ? true : false;
	}

}
