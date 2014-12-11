require 'rails_helper'

RSpec.describe "nuclear_codes/edit", :type => :view do
  before(:each) do
    @nuclear_code = assign(:nuclear_code, NuclearCode.create!())
  end

  it "renders the edit nuclear_code form" do
    render

    assert_select "form[action=?][method=?]", nuclear_code_path(@nuclear_code), "post" do
    end
  end
end
