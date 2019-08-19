require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :name => "MyString",
      :description => "MyText",
      :main_image => "MyString",
      :gallery => "MyText",
      :color => "MyString",
      :location => "MyString",
      :price => 1.5,
      :require_rsvp => false,
      :club => nil
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input[name=?]", "event[name]"

      assert_select "textarea[name=?]", "event[description]"

      assert_select "input[name=?]", "event[main_image]"

      assert_select "textarea[name=?]", "event[gallery]"

      assert_select "input[name=?]", "event[color]"

      assert_select "input[name=?]", "event[location]"

      assert_select "input[name=?]", "event[price]"

      assert_select "input[name=?]", "event[require_rsvp]"

      assert_select "input[name=?]", "event[club_id]"
    end
  end
end
