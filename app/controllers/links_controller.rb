class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  #after_action :add_url_to_session, only: [:create]

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
    @top_links = Link.order(clicks: :desc).first(10)
  end

  # GET /links/1
  # GET /links/1.json
  def show
    if params[:slug]
      @link = Link.find_by(slug: params[:slug])
      if redirect_to @link.given_url
        @link.clicks += 1
        @link.save
      end
    else
      @link = Link.find(params[:id])
    end
  end
  
  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    @link.title = grab_title(@link)

    if @link.valid?
      @link.save
      add_url_to_session
      @notice = 'Link was successfully created.'
    else
      @errors = @link.errors 
    end

    #render inline: "location.reload();"
    redirect_to root_path      

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find_by(slug: params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:given_url)
    end

    # Store parameters for url into session in order to show list of urls to user 
    def add_url_to_session  
      session[:shrinked_links] ||= []  
      session[:shrinked_links] << @link
    end

    # Grab a title of given_url
    def grab_title(link)
      require 'open-uri'
      page = Nokogiri::HTML(open(link.given_url))
      return page.title
    end 

end
