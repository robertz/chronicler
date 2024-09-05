<cfoutput>
<div class="container mt-2">

	<div class="row">
		<div class="col-md-12 col-lg-8">
			<div style="background: url(#prc.post.cover_image#) no-repeat center center; background-size: cover; height: 350px;">
				<div class="bg-dark w-75 opacity-75 p-2">
					<p class="h2 text-white">#prc.post.title#</p>
					<small class="d-block text-white py-1">#prc.post.description#</small>
					<cfloop array="#prc.post.tags.listToArray()#" index="tag">
						<span class="badge bg-light m-1 p-2 h5 text-dark">#tag#</span>
					</cfloop>
					<p class="text-white small text-uppercase">
						#dateFormat(prc.post.publish_date, "MMMM d, YYYY")# /
						#prc.post.display_name#
					</p>
				</div>
			</div>
			<div class="mt-4">
				#prc.rendered#
			</div>
		</div>
	</div>

</div>
</cfoutput>