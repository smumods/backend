require 'rails_helper'

RSpec.describe "clubs/index", type: :view do
  before(:each) do
    assign(:clubs, [
      Club.create!(
        :name => "Name",
        :slug => "Slug",
        :display_picture => "Display Picture",
        :gallery => "MyText",
        :description => "MyText",
        :social_media => "MyText"
      ),
      Club.create!(
        :name => "Name",
        :slug => "Slug",
        :display_picture => "Display Picture",
        :gallery => "MyText",
        :description => "MyText",
        :social_media => "MyText"
      )
    ])
  end

  it "renders a list of clubs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "Display Picture".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
