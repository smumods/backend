require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :name => "Name",
      :description => "MyText",
      :main_image => "Main Image",
      :gallery => "MyText",
      :color => "Color",
      :location => "Location",
      :price => 2.5,
      :require_rsvp => false,
      :club => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Main Image/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
