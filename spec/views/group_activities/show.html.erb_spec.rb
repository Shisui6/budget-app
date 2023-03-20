require 'rails_helper'

RSpec.describe "group_activities/show", type: :view do
  before(:each) do
    assign(:group_activity, GroupActivity.create!(
      activity: nil,
      group: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
