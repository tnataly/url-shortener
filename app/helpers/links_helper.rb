module LinksHelper
	# displays shorturl with full path	
	def display_full_shorturl(link_id)
		request.base_url + "/" + Link.find(link_id).slug
	end

end
