require 'rails_helper'

RSpec.describe "launchstarts/new", :type => :view do
  before(:each) do
    assign(:launchstart, Launchstart.new())
  end

  it "renders new launchstart form" do
    render

    assert_select "form[action=?][method=?]", launchstarts_path, "post" do
    end
  end
end
