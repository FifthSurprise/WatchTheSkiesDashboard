require 'rails_helper'

RSpec.describe "Launchstarts", :type => :request do
  describe "GET /launchstarts" do
    it "works! (now write some real specs)" do
      get launchstarts_path
      expect(response).to have_http_status(200)
    end
  end
end
