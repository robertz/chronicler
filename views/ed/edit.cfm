<cfoutput>
<div class="container">
	<form action="/ed/save" method="post">
		<div class="card">
			<div class="card-body">
				<div class="card-text">
					<div class="row">
						<div class="col-2 my-1 text-end pt-2 fw-bold">ID:</div>
						<div class="col-10 my-1"><input type="text" class="form-control" name="id" value="#prc.id#" readonly></div>

						<div class="col-2 my-1 text-end pt-2 fw-bold">Title:</div>
						<div class="col-10 my-1"><input type="text" class="form-control" name="title" value="#prc.post.title#"></div>

						<div class="col-2 my-1 text-end pt-2 fw-bold">Slug:</div>
						<div class="col-10 my-1"><input type="text" class="form-control" name="slug" value="#prc.post.slug#"></div>

						<div class="col-2 my-1 text-end pt-2 fw-bold">Description:</div>
						<div class="col-10 my-1"><input type="text" class="form-control" name="description" value="#prc.post.description#"></div>

						<div class="col-2 my-1 text-end pt-2 fw-bold">Cover Image:</div>
						<div class="col-10 my-1"><input type="text" class="form-control" name="cover_image" value="#prc.post.cover_image#"></div>

						<div class="col-2 my-1 text-end pt-2 fw-bold">Publish Date:</div>
						<div class="col-10 my-1"><input type="text" class="form-control" name="publish_date" value="#dateTimeFormat(prc.post.publish_date, "yyyy-mm-dd' 'HH:nn:ss")#"></div>

					</div>

					<textarea class="form-control my-4" rows="20" name="body">#prc.post.body#</textarea>

					<div class="my-2">
						<button type="submit" class="btn btn-primary">Submit</button>
						<a href="/ed" class="btn btn-danger">Cancel</a>
					</div>
				</div>
			</div>
		</div>

	</form>
</div>
</cfoutput>