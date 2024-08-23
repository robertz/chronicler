<cfoutput>
	<cfloop array="#prc.posts#" index="post">
		<div class="row py-2">
			<div class="col-3">
				<img src="#post.cover_image#" alt="" class="img-thumbnail rounded">
			</div>
			<div class="col-9">
				<div class="h5">#post.title#</div>
				#post.description#
			</div>
		</div>
	</cfloop>
</cfoutput>
