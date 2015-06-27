require 'rails_helper'

RSpec.describe "internal_messages/show", :type => :view do
  before(:each) do
    @internal_message = assign(:internal_message, InternalMessage.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
