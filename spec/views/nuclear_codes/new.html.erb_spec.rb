require 'rails_helper'

RSpec.describe "nuclear_codes/new", :type => :view do
  before(:each) do
    assign(:nuclear_code, NuclearCode.new())
  end

  it "renders new nuclear_code form" do
    render

    assert_select "form[action=?][method=?]", nuclear_codes_path, "post" do
    end
  end
end
