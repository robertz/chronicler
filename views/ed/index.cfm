<cfoutput>

    <div class="card mt-5">
        <div class="card-body">
            <div class="card-text">
                <table class="table table-striped table-bordered table-sm	">
                    <thead>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Created</th>
                        <th>Updated</th>
                    </thead>
                    <tbody>
                        <cfloop array="#prc.posts#" index="p">
                            <tr>
                                <td><a href="/ed/view/id/#p.id#">#p.title#</a></td>
                                <td>#p.description#</td>
                                <td>#dateTimeFormat(p.created, "medium")#</td>
                                <td>#dateTimeFormat(p.last_updated, "medium")#</td>
                            </tr>
                        </cfloop>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</cfoutput>