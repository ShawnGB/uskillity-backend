require 'rails_helper'

RSpec.describe "tags/index", type: :view do
  before(:each) do
    assign(:tags, [
      Tag.create!(
        :text => "Text",
        :lang => 2
      ),
      Tag.create!(
        :text => "Text",
        :lang => 2
      )
    ])
  end

  it "renders a list of tags" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
