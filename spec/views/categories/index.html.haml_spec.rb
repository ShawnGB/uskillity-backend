require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        :parent => nil,
        :name => ""
      ),
      Category.create!(
        :parent => nil,
        :name => ""
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
