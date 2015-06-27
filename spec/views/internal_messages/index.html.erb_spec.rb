require 'rails_helper'

RSpec.describe "internal_messages/index", :type => :view do
  before(:each) do
    assign(:internal_messages, [
      InternalMessage.create!(),
      InternalMessage.create!()
    ])
  end

  it "renders a list of internal_messages" do
    render
  end
end
