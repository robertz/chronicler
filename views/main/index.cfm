<cfoutput>
    <div class="container">

        <div class="row">

			<div class="col-12">
                <cfloop array="#prc.posts.results#" index="post">

                    <div class="row m-1 rounded border border-2 ">
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



			<div class="col-6">
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

			<div class="col-6">
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