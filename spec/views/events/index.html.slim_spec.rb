require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :name => "Name",
        :description => "MyText",
        :main_image => "Main Image",
        :gallery => "MyText",
        :color => "Color",
        :location => "Location",
        :price => 2.5,
        :require_rsvp => false,
        :club => nil
      ),
      Event.create!(
        :name => "Name",
        :description => "MyText",
        :main_image => "Main Image",
        :gallery => "MyText",
        :color => "Color",
        :location => "Location",
        :price => 2.5,
        :require_rsvp => false,
        :club => nil
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Main Image".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
