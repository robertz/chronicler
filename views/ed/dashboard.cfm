<cfoutput>
    <div class="container mt-5">

		#view("partials/ed/navigation")#

        <div class="card mt-5">
            <div class="card-body">
                <div class="card-text">
                    <h5 class="card-title">Draft Posts</h5>
                    <table class="table table-striped table-bordered">
                        <thead>
                            <th>Actions</th>
                            <th>Title</th>
							<th>Tags</th>
                            <th>Created</th>
                            <th>Updated</th>
                        </thead>
                        <tbody>
                            <cfloop array="#prc.drafts#" index="p">
                                <tr>
                                    <td>
                                        <a href="/ed/view/id/#p.id#"><i class="bi bi-eye-fill m-2"></i></a>
                                        <a href="/ed/edit/id/#p.id#"><i class="bi bi-pencil-square m-2"></i></a>
                                    </td>
                                    <td>#p.title#</td>
									<td>#p.tags#</td>
                                    <td>#dateTimeFormat(p.created, "medium")#</td>
                                    <td>#dateTimeFormat(p.last_updated, "medium")#</td>
                                </tr>
                            </cfloop>
                        </tbody>
                    </table>

                    <a href="/ed/edit" class="btn btn-primary">New Post</a>
                </div>
            </div>
        </div>

        <div class="card mt-5">
            <div class="card-body">
                <div class="card-text">
                    <h5 class="card-title">Published Posts</h5>
                    <table class="table table-striped table-bordered">
                        <thead>
                            <th>Actions</th>
                            <th>Title</th>
							<th>Tags</th>
                            <th>Published</th>
							<th>Views</th>
                        </thead>
                        <tbody>
                            <cfloop array="#prc.published.results#" index="p">
                                <tr>
                                    <td>
                                        <a href="/ed/view/id/#p.id#"><i class="bi bi-eye-fill m-2"></i></a>
                                        <a href="/ed/edit/id/#p.id#"><i class="bi bi-pencil-square m-2"></i></a>
                                    </td>
                                    <td>#p.title#</td>
									<td>#p.tags#</td>
                                    <td>#dateFormat(p.publish_date, "yyyy-mm-dd")#</td>
									<td>#p.views#</td>
                                </tr>
                            </cfloop>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</cfoutput>