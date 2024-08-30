<!--- All methods in this helper will be available in all handlers,views & layouts --->
<cfscript>

	function buildPermalink(required struct post){
		return "/posts/#post.publish_date.format("yyyy")#/#post.publish_date.format("mm")#/#post.slug#";
	}

</cfscript>