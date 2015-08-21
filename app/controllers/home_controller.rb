class HomeController < ApplicationController
	
	def index
		@link = Link.new
		@top_links = Link.order(clicks: :desc).first(10)
		@base_url = request.base_url
	end

end
