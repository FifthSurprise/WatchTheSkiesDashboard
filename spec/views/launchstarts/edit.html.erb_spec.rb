require 'rails_helper'

RSpec.describe "launchstarts/edit", :type => :view do
  before(:each) do
    @launchstart = assign(:launchstart, Launchstart.create!())
  end

  it "renders the edit launchstart form" do
    render

    assert_select "form[action=?][method=?]", launchstart_path(@launchstart), "post" do
    end
  end
end
