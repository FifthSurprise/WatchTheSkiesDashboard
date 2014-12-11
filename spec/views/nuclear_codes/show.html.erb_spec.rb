require 'rails_helper'

RSpec.describe "nuclear_codes/show", :type => :view do
  before(:each) do
    @nuclear_code = assign(:nuclear_code, NuclearCode.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
