require 'rails_helper'

RSpec.describe "NuclearCodes", :type => :request do
  describe "GET /nuclear_codes" do
    it "works! (now write some real specs)" do
      get nuclear_codes_path
      expect(response).to have_http_status(200)
    end
  end
end
