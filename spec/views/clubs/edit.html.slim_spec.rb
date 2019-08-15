require 'rails_helper'

RSpec.describe "clubs/edit", type: :view do
  before(:each) do
    @club = assign(:club, Club.create!(
      :name => "MyString",
      :slug => "MyString",
      :display_picture => "MyString",
      :gallery => "MyText",
      :description => "MyText",
      :social_media => "MyText"
    ))
  end

  it "renders the edit club form" do
    render

    assert_select "form[action=?][method=?]", club_path(@club), "post" do

      assert_select "input[name=?]", "club[name]"

      assert_select "input[name=?]", "club[slug]"

      assert_select "input[name=?]", "club[display_picture]"

      assert_select "textarea[name=?]", "club[gallery]"

      assert_select "textarea[name=?]", "club[description]"

      assert_select "textarea[name=?]", "club[social_media]"
    end
  end
end
