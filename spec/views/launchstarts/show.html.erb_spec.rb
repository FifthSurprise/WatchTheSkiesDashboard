require 'rails_helper'

RSpec.describe "launchstarts/show", :type => :view do
  before(:each) do
    @launchstart = assign(:launchstart, Launchstart.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
