require 'rails_helper'

RSpec.describe "launchstarts/index", :type => :view do
  before(:each) do
    assign(:launchstarts, [
      Launchstart.create!(),
      Launchstart.create!()
    ])
  end

  it "renders a list of launchstarts" do
    render
  end
end
