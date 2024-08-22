<cfoutput>
<form>

	<div class="card">
		<div class="card-body">
			<div class="card-text">
				<div class="row">
					<div class="col-2 my-1 text-end pt-2 fw-bold">ID:</div>
					<div class="col-10 my-1"><input type="text" class="form-control" value="#prc.post.id#" readonly></div>

					<div class="col-2 my-1 text-end pt-2 fw-bold">Title:</div>
					<div class="col-10 my-1"><input type="text" class="form-control" value="#prc.post.title#"></div>

					<div class="col-2 my-1 text-end pt-2 fw-bold">Description:</div>
					<div class="col-10 my-1"><input type="text" class="form-control" value="#prc.post.description#"></div>

					<div class="col-2 my-1 text-end pt-2 fw-bold">Slug:</div>
					<div class="col-10 my-1"><input type="text" class="form-control" value="#prc.post.slug#"></div>

				</div>

				<textarea class="form-control my-4" rows="20">#prc.post.body#</textarea>
			</div>
		</div>
	</div>

</form>
</cfoutput>