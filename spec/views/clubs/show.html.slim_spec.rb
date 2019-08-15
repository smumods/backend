require 'rails_helper'

RSpec.describe "clubs/show", type: :view do
  before(:each) do
    @club = assign(:club, Club.create!(
      :name => "Name",
      :slug => "Slug",
      :display_picture => "Display Picture",
      :gallery => "MyText",
      :description => "MyText",
      :social_media => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/Display Picture/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
