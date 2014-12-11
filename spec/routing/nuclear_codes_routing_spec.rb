require "rails_helper"

RSpec.describe NuclearCodesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/nuclear_codes").to route_to("nuclear_codes#index")
    end

    it "routes to #new" do
      expect(:get => "/nuclear_codes/new").to route_to("nuclear_codes#new")
    end

    it "routes to #show" do
      expect(:get => "/nuclear_codes/1").to route_to("nuclear_codes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/nuclear_codes/1/edit").to route_to("nuclear_codes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/nuclear_codes").to route_to("nuclear_codes#create")
    end

    it "routes to #update" do
      expect(:put => "/nuclear_codes/1").to route_to("nuclear_codes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/nuclear_codes/1").to route_to("nuclear_codes#destroy", :id => "1")
    end

  end
end
