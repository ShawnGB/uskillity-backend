require 'rails_helper'

RSpec.describe "tags/new", type: :view do
  before(:each) do
    assign(:tag, Tag.new(
      :text => "MyString",
      :lang => 1
    ))
  end

  it "renders new tag form" do
    render

    assert_select "form[action=?][method=?]", tags_path, "post" do

      assert_select "input#tag_text[name=?]", "tag[text]"

      assert_select "input#tag_lang[name=?]", "tag[lang]"
    end
  end
end
