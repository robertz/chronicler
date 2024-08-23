<cfoutput>
<div class="container">
	<cfloop array="#prc.posts#" index="post">

		<div class="card my-2">
			<!--- <div class="card-body"> --->
				<!--- <div class="card-text"> --->
					<div class="row p-2">
						<div class="col-3">
							<img src="#post.cover_image#" alt="" class="img-thumbnail rounded">
						</div>
						<div class="col-9">
							<div class="h5">#post.title#</div>
							#post.description#
						</div>
					<!--- </div> --->
				<!--- </div> --->
			</div>
		</div>

	</cfloop>
</div>
</cfoutput>
