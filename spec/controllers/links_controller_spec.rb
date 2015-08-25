require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  after(:all) do
      Link.delete_all
    end

  let(:valid_attributes) {
    {given_url: "http://climb.te.ua"}
  }

  let(:invalid_attributes) {
    {given_url: ""}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all links as @links" do
      link = Link.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:links)).to eq([link])
    end
  end

    describe "GET #index" do
    it "assigns top links as @top_links" do
      link = Link.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:links)).to eq([link])
    end
  end

  describe "GET #show" do
    it "assigns the requested link as @link" do
      link = Link.create! valid_attributes
      get :show, {:id => link.to_param}, valid_session
      expect(assigns(:link)).to eq(link)
    end

    it "redirects to the given_url if params[:slug]" do
      link = Link.create! valid_attributes
      get :show, {:slug => link.slug}, valid_session
      expect(response).to redirect_to(link.given_url)    
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Link" do
        expect {
          post :create, {:link => valid_attributes}, valid_session
        }.to change(Link, :count).by(1)
      end

      it "assigns a newly created link as @link" do
        post :create, {:link => valid_attributes}, valid_session
        expect(assigns(:link)).to be_a(Link)
        expect(assigns(:link)).to be_persisted
      end

      it "redirects to the root_path" do
        post :create, {:link => valid_attributes}, valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved link as @link" do
        post :create, {:link => invalid_attributes}, valid_session
        expect(assigns(:link)).to be_a_new(Link)
      end

      it "re-renders the 'new' template" do
        post :create, {:link => invalid_attributes}, valid_session
        expect(response).to redirect_to(root_path)
      end
    end
  end

end
