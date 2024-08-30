<cfoutput>
<div class="container">

	<div class="col-sm-12 col-md-9">
		<cfloop array="#prc.posts#" index="post">

			<div class="row my-2 rounded border border-1">
				<div class="col-3 rounded-start" style="background: url(#post.cover_image#) no-repeat center center; background-size: cover; height: 175px;">
					<a href="/posts/#post.publish_date.format("yyyy")#/#post.publish_date.format("mm")#/#post.slug#" class="d-block w-100 h-100"></a>
				</div>
				<div class="col-9 rounded-end pt-4 position-relative">
					<div class="h4">
						<a href="/posts/#post.publish_date.format("yyyy")#/#post.publish_date.format("mm")#/#post.slug#" class="text-dark text-decoration-none">#post.title# </a>
					</div>
					#post.description#

					<div class="position-absolute bottom-0 start-1 pb-2">
						<span class="fw-bold">Published:</span> #post.publish_date.dateFormat("short")#
					</div>
				</div>
			</div>

		</cfloop>
	</div>
	<div class="hidden-sm col-md-3">

	</div>
</div>
</cfoutput>