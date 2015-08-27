class HomeController < ApplicationController
	
	def index
		@link = Link.new
		#session.delete(:shrinked_links)
		#render inline: "location.reload();"
	end

end
