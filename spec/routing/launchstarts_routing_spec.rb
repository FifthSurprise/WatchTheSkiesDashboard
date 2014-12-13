require "rails_helper"

RSpec.describe LaunchstartsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/launchstarts").to route_to("launchstarts#index")
    end

    it "routes to #new" do
      expect(:get => "/launchstarts/new").to route_to("launchstarts#new")
    end

    it "routes to #show" do
      expect(:get => "/launchstarts/1").to route_to("launchstarts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/launchstarts/1/edit").to route_to("launchstarts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/launchstarts").to route_to("launchstarts#create")
    end

    it "routes to #update" do
      expect(:put => "/launchstarts/1").to route_to("launchstarts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/launchstarts/1").to route_to("launchstarts#destroy", :id => "1")
    end

  end
end
