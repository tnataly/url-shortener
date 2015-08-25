module LinksHelper
	# displays shorturl with full path	
	def display_full_shorturl(link)
		request.base_url + "/" + link.slug
	end

end
