class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  after_action :add_url_to_session, only: [:create]

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

    respond_to do |format|
      if @link.save
        format.html { redirect_to :back, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: root_path }
        format.js {render inline: "location.reload();" }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
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

      if session[:shrinked_links].nil?
        session[:shrinked_links] = Array.new
      end  
      session[:shrinked_links] << @link
  
    end
end
