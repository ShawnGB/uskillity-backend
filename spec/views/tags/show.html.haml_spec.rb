require 'rails_helper'

RSpec.describe "tags/show", type: :view do
  before(:each) do
    @tag = assign(:tag, Tag.create!(
      :text => "Text",
      :lang => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/2/)
  end
end
