require 'rails_helper'

RSpec.describe "tags/edit", type: :view do
  before(:each) do
    @tag = assign(:tag, Tag.create!(
      :text => "MyString",
      :lang => 1
    ))
  end

  it "renders the edit tag form" do
    render

    assert_select "form[action=?][method=?]", tag_path(@tag), "post" do

      assert_select "input#tag_text[name=?]", "tag[text]"

      assert_select "input#tag_lang[name=?]", "tag[lang]"
    end
  end
end
