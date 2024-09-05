<cfoutput>
<!doctype html>
<html lang="en">

<head>
	<!--- Metatags --->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<cfif NOT prc.keyExists("meta")>
		<meta name="author" content="KISDigital">
		<meta name="description" content="KISDigital Blog">
		<meta name="keywords" content="">
	<cfelse>
		<meta name="author" content="KISDigital">
		<cfloop array="#prc.meta#" index="i">
			#i#
		</cfloop>
	</cfif>
	<base href="#event.getHTMLBaseURL()#" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism-themes/1.9.0/prism-one-dark.min.css" integrity="sha512-c6S8OdtvoqZCbMfA1lWE0qd368pLdFvVHVILQzNizfowC+zV8rmVKdSlmL5SuidvATO0A7awDg53axd+s/9amw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="/resources/css/site.css">
	<style>
		.text-blue {
			color: ##379BC1;
		}
	</style>
	<title>KISDigital</title>
</head>

<body data-spy="scroll" data-target=".navbar" data-offset="50" style="padding-top: 60px" class="d-flex flex-column h-100 bg-light">
	<!---Top NavBar --->
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			<div class="container-fluid">
				<!---Brand --->
				<a class="navbar-brand" href="#event.buildLink( '' )#">
					<span style="color: var(--post-link-text);">KIS</span>Digital
				</a>

				<!--- Mobile Toggler --->
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="##navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav">

						<li class="nav-item">
							<a href="/latest" class="nav-link">Latest</a>
						</li>

						<cfif client.keyExists("uid") && len(client.uid)>
							<li class="nav-item">
								<a href="/ed/dashboard" class="nav-link">Ed</a>
							</li>
						</cfif>
					</ul>

				</div>
			</div>
		</nav>
	</header>

	<!---Container And Views --->
	<main class="flex-shrink-0">
		#view()#
	</main>

	<!--- Footer --->
	<!--- <footer class="w-100 bottom-0 position-fixed border-top py-3 mt-5 bg-light">
	<div class="container">
		<p class="float-end">
			<a href="##" class="btn btn-info rounded-circle shadow" role="button">
				<i class="bi bi-arrow-bar-up"></i> <span class="visually-hidden">Top</span>
			</a>
		</p>
	</div>
</footer> --->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.23.0/prism.min.js" integrity="sha512-YBk7HhgDZvBxmtOfUdvX0z8IH2d10Hp3aEygaMNhtF8fSOvBZ16D/1bXZTJV6ndk/L/DlXxYStP8jrF77v2MIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<cfif prc.keyExists("footerJS")>
		<cfloop array="#prc.footerJS#" index="i">
			#i#
		</cfloop>
	</cfif>
</body>

</html>
</cfoutput>