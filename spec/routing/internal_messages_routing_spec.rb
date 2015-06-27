require "rails_helper"

RSpec.describe InternalMessagesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/internal_messages").to route_to("internal_messages#index")
    end

    it "routes to #new" do
      expect(:get => "/internal_messages/new").to route_to("internal_messages#new")
    end

    it "routes to #show" do
      expect(:get => "/internal_messages/1").to route_to("internal_messages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/internal_messages/1/edit").to route_to("internal_messages#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/internal_messages").to route_to("internal_messages#create")
    end

    it "routes to #update" do
      expect(:put => "/internal_messages/1").to route_to("internal_messages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/internal_messages/1").to route_to("internal_messages#destroy", :id => "1")
    end

  end
end
