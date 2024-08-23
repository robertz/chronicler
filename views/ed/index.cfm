<cfoutput>

    <div class="card mt-5">
        <div class="card-body">
            <div class="card-text">
                <table class="table table-striped table-bordered table-sm	">
                    <thead>
						<th>Actions</th>
                        <th>Title</th>
                        <th>Created</th>
                        <th>Updated</th>
                    </thead>
                    <tbody>
                        <cfloop array="#prc.posts#" index="p">
                            <tr>
								<td>
									<a href="/ed/view/id/#p.id#">View</a>
									<a href="/ed/edit/id/#p.id#">Edit</a>
								</td>
                                <td>#p.title#</td>
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

</cfoutput>