<cfoutput>
<div class="d-flex align-items-center flex-column">


	<div class="mx-auto w-25">
		<div class="card mt-5">
			<div class="card-body">
				<h5 class="card-title">Login</h5>
				<div class="card-text">
					<form method="POST">
						<input type="hidden" name="token" value="#prc.token#">
						<div class="mb-2">
							<label for="user" class="form-label">Username:</label>
							<input type="email" id="user" name="user" class="form-control" value="#prc.user#" placeholder="user@email.com" />
						</div>

						<div class="mb-2">
							<label for="pass">Password:</label>
							<input type="password" id="pass" name="pass" class="form-control" value="" placeholder="Password" />
						</div>

						<div class="mb-2">
							<input type="submit" value="Submit" class="btn btn-primary" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


</div>
</cfoutput>