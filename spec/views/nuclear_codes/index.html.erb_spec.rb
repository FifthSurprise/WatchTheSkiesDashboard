require 'rails_helper'

RSpec.describe "nuclear_codes/index", :type => :view do
  before(:each) do
    assign(:nuclear_codes, [
      NuclearCode.create!(),
      NuclearCode.create!()
    ])
  end

  it "renders a list of nuclear_codes" do
    render
  end
end
