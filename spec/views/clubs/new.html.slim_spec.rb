require 'rails_helper'

RSpec.describe "clubs/new", type: :view do
  before(:each) do
    assign(:club, Club.new(
      :name => "MyString",
      :slug => "MyString",
      :display_picture => "MyString",
      :gallery => "MyText",
      :description => "MyText",
      :social_media => "MyText"
    ))
  end

  it "renders new club form" do
    render

    assert_select "form[action=?][method=?]", clubs_path, "post" do

      assert_select "input[name=?]", "club[name]"

      assert_select "input[name=?]", "club[slug]"

      assert_select "input[name=?]", "club[display_picture]"

      assert_select "textarea[name=?]", "club[gallery]"

      assert_select "textarea[name=?]", "club[description]"

      assert_select "textarea[name=?]", "club[social_media]"
    end
  end
end
