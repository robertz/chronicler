<cfoutput>
    <div class="card my-4">
        <div class="card-body">
            <div class="card-text">

                <div style="background: url(#prc.post.cover_image#) no-repeat center center; background-size: cover; height: 350px;">
                    <div class="bg-dark w-75 opacity-75 p-2">
                        <p class="h2 text-white">#prc.post.title#</p>
                        <small class="d-block text-white py-1">#prc.post.description#</small>
                        <!--- <cfloop array="#prc.tags#" index="tag">
							<span class="badge bg-light m-1 p-2 h5 text-dark">#tag#</span>
						</cfloop> --->
                        <p class="text-white small text-uppercase">
                            #dateFormat(prc.post.created, "MMMM d, YYYY")# /
                            <!--- #prc.author# ---> Rob
                        </p>
                    </div>
                </div>

                <div class="">
                    #prc.rendered#
                </div>

            </div>
        </div>
    </div>


</cfoutput>