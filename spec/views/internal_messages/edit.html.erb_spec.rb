require 'rails_helper'

RSpec.describe "internal_messages/edit", :type => :view do
  before(:each) do
    @internal_message = assign(:internal_message, InternalMessage.create!())
  end

  it "renders the edit internal_message form" do
    render

    assert_select "form[action=?][method=?]", internal_message_path(@internal_message), "post" do
    end
  end
end
