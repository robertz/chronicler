<cfoutput>
<div class="container">

	<div class="row">

		<div class="col-sm-12 col-md-6">
			<a href="#buildPermalink(prc.posts.results[1])#">
				<div class="p-1 rounded border border-2 h-100 position-relative" style="background: url(#prc.posts.results[1].cover_image#) no-repeat center center; background-size: cover; min-height: 160px;">
					<div class="text-white p-4 rounded w-75 bg-dark opacity-75">
						<div class="h5">#prc.posts.results[1].title#</div>
						<div class="mt-2 small">#prc.posts.results[1].description#</div>
					</div>
				</div>
			</a>
		</div>
		<div class="col-sm-12 col-md-6">

			<cfloop from="2" to="#arrayLen(prc.posts.results)#" index="i">
				<div class="row m-1 rounded border border-2 ">
					<div class="col-3 rounded-start" style="background: url(#prc.posts.results[i].cover_image#) no-repeat center center; background-size: cover; height: 160px;">
						<a href="#buildPermalink(prc.posts.results[i])#" class="d-block w-100 h-100"></a>
					</div>
					<div class="col-9 rounded-end pt-2 d-flex align-items-start flex-column">
						<div class="h4">
							<a href="#buildPermalink(prc.posts.results[i])#" class="text-dark text-decoration-none">#prc.posts.results[i].title# </a>
						</div>
						#prc.posts.results[i].description# <br>
						<div class="mt-auto pb-2 d-none d-lg-none d-xl-block">
							<span class="fw-bold hidden-md">Published:</span> #prc.posts.results[i].publish_date.dateFormat("long")#
						</div>

					</div>
				</div>
			</cfloop>
		</div>



		<div class="col-sm-12 col-md-6 my-2">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Trending</h5>
					<div class="card-text p-1">
						<cfloop from="1" to="3" index="i">
							<div class="row my-1 rounded border border-2">
								<div class="col-3 rounded-start" style="background: url(#prc.trending[i].cover_image#) no-repeat center center; background-size: cover; height: 100px;">
									<a href="#buildPermalink(prc.trending[i])#" class="d-block w-100 h-100"></a>
								</div>
								<div class="col-9 rounded-end pt-2 position-relative">
									<div class="fw-bold">
										<a href="#buildPermalink(prc.trending[i])#" class="text-dark text-decoration-none">#prc.trending[i].title# </a>
									</div>
								</div>
							</div>
						</cfloop>
						<div class="mt-3 text-end">
							<a href="/latest">More Posts</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-sm-12 col-md-6 my-2">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Most Read</h5>
					<div class="card-text p-1">
						<cfloop from="1" to="3" index="i">
							<div class="row my-1 rounded border border-2">
								<div class="col-3 rounded-start" style="background: url(#prc.mostRead[i].cover_image#) no-repeat center center; background-size: cover; height: 100px;">
									<a href="#buildPermalink(prc.mostRead[i])#" class="d-block w-100 h-100"></a>
								</div>
								<div class="col-9 rounded-end pt-2 position-relative">
									<div class="fw-bold">
										<a href="#buildPermalink(prc.mostRead[i])#" class="text-dark text-decoration-none">#prc.mostRead[i].title# </a>
									</div>
								</div>
							</div>
						</cfloop>
						<div class="mt-3 text-end">
							<a href="/latest">More Posts</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

</div>
</cfoutput>