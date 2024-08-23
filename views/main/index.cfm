<cfoutput>
<div class="container">
	<cfloop array="#prc.posts#" index="post">

		<div class="card my-2">

			<div class="row p-2">
				<div class="col-3">
					<div style="background: url(#post.cover_image#) no-repeat center center; background-size: cover; height: 175px;" class="rounded border border-5 border-muted"></div>
				</div>
				<div class="col-9">
					<div class="h5">#post.title#</div>
					#post.description#
				</div>

			</div>
		</div>

	</cfloop>
</div>
</cfoutput>