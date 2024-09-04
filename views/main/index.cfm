<cfoutput>
    <div class="container">

        <div class="row">
            <div class="col-sm-12 col-md-8">
                <cfloop array="#prc.posts.results#" index="post">

                    <div class="row my-1 rounded border border-2">
                        <div class="col-3 rounded-start" style="background: url(#post.cover_image#) no-repeat center center; background-size: cover; height: 125px;">
                            <a href="#buildPermalink(post)#" class="d-block w-100 h-100"></a>
                        </div>
                        <div class="col-9 rounded-end pt-2 position-relative">
                            <div class="h4">
                                <a href="#buildPermalink(post)#" class="text-dark text-decoration-none">#post.title# </a>
                            </div>
                            #post.description#

                            <div class="position-absolute bottom-0 start-1 pb-2">
                                <span class="fw-bold">Published:</span> #post.publish_date.dateFormat("short")#
                            </div>

                        </div>
                    </div>

                </cfloop>
            </div>
            <div class="col-md-4 pl-1 my-1">
                <div class="card">
                    <div class="card-body">
						<h5 class="card-title">Latest Posts</h5>
                        <div class="card-text p-1">
                            <cfloop from="1" to="3" index="i">
								<div class="row my-1 rounded border border-2">
									<div class="col-3 rounded-start" style="background: url(#prc.posts.results[i].cover_image#) no-repeat center center; background-size: cover; height: 100px;">
										<a href="#buildPermalink(prc.posts.results[i])#" class="d-block w-100 h-100"></a>
									</div>
									<div class="col-9 rounded-end pt-2 position-relative">
										<div class="fw-bold">
											<a href="#buildPermalink(prc.posts.results[i])#" class="text-dark text-decoration-none">#prc.posts.results[i].title# </a>
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