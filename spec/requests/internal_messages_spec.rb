require 'rails_helper'

RSpec.describe "InternalMessages", :type => :request do
  describe "GET /internal_messages" do
    it "works! (now write some real specs)" do
      get internal_messages_path
      expect(response).to have_http_status(200)
    end
  end
end
