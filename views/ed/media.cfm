<cfoutput>
<div class="container mt-5">

	#view("partials/ed/navigation")#

	<div class="card mt-5">
		<div class="card body">
			<div class="card-text">
				<div class="d-flex flex-wrap justify-content-center">
					<cfloop array="#prc.images#" index="image">
						<img src="#image.imagepath#" class="img-thumbnail m-2" style="width: 200px; height: 175px; object-fit: cover;" alt="#image.imagepath#" />
					</cfloop>
				</div>
			</div>
		</div>
	</div>
</div>
</cfoutput>