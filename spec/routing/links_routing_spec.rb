require "rails_helper"

RSpec.describe LinksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/links").to route_to("links#index")
    end

    it "routes to #show" do
      expect(:get => "/links/1").to route_to("links#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/links").to route_to("links#create")
    end

  end
end
