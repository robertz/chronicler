<cfoutput>

    <div class="card">
        <div class="card-body">
            <div class="card-text">
                <div class="row">
                    <div class="col-2">id</div>
                    <div class="col-10">#prc.post.id#</div>

                    <div class="col-2">title</div>
                    <div class="col-10">#prc.post.title#</div>

                    <div class="col-2">description</div>
                    <div class="col-10">#prc.post.description#</div>

                    <div class="col-2">slug</div>
                    <div class="col-10">#prc.post.slug#</div>

                </div>

                <textarea class="form-control my-4" rows="25">#prc.post.body#</textarea>
            </div>
        </div>
    </div>



</cfoutput>