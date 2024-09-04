<cfoutput>
    <div class="container">

        <div class="row">
            <div class="col-sm-12 col-md-8">
                <cfloop array="#prc.posts.results#" index="post">

                    <div class="row my-1 rounded border border-2">

                        <div class="col-3 rounded-start" style="background: url(#post.cover_image#) no-repeat center center; background-size: cover; height: 160px;">
                            <a href="#buildPermalink(post)#" class="d-block w-100 h-100"></a>
                        </div>
                        <div class="col-9 rounded-end pt-2 d-flex align-items-start flex-column">
                            <div class="h4">
                                <a href="#buildPermalink(post)#" class="text-dark text-decoration-none">#post.title# </a>
                            </div>
                            #post.description#

                            <div class="mt-auto pb-2 d-none d-lg-none d-xl-block align-bottom">
                                <span class="fw-bold">Published:</span> #post.publish_date.dateFormat("long")#
                            </div>

                        </div>
                    </div>

                </cfloop>

                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item #prc.posts.pagination.page LTE 1 ? 'disabled' : ''#"><a class="page-link" href="/latest/page/#prc.posts.pagination.page GT 1 ? prc.posts.pagination.page - 1 : 1#">Previous</a></li>

                        <cfloop from="1" to="#prc.posts.pagination.totalPages#" index="i">
                            <li class="page-item"><a class="page-link #prc.posts.pagination.page eq i ? 'active' : ''#" href="/latest/page/#i#">#i#</a></li>
                        </cfloop>

                        <li class="page-item"><a class="page-link #prc.posts.pagination.page GTE prc.posts.pagination.totalPages? 'disabled' : ''#" href="/latest/page/#prc.posts.pagination.page LT prc.posts.pagination.totalPages ? prc.posts.pagination.page + 1 : prc.posts.pagination.totalPages#">Next</a></li>
                    </ul>
                </nav>

            </div>
            <div class="col-md-4 pl-1 my-1">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Most Read</h5>
                        <div class="card-text p-1">
                            <cfloop from="1" to="#arrayLen(prc.mostRead)#" index="i">
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
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</cfoutput>