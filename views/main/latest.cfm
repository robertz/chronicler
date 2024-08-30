<cfoutput>
    <div class="container">

        <div class="row">
            <div class="col-sm-12 col-md-8">
                <cfloop array="#prc.posts#" index="post">

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
                        <h5 class="card-title">Recent Posts</h5>
                        <div class="card-text">
                            <cfloop from="1" to="5" index="i">
                                <a href="#buildPermalink(prc.posts[i])#" style="color: var(--post-link-text); text-decoration">#prc.posts[i].title#</a><br />
                            </cfloop>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>
</cfoutput>