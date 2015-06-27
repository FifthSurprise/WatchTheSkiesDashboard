require 'rails_helper'

RSpec.describe "internal_messages/new", :type => :view do
  before(:each) do
    assign(:internal_message, InternalMessage.new())
  end

  it "renders new internal_message form" do
    render

    assert_select "form[action=?][method=?]", internal_messages_path, "post" do
    end
  end
end
