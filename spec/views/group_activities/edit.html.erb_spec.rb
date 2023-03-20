require 'rails_helper'

RSpec.describe "group_activities/edit", type: :view do
  let(:group_activity) {
    GroupActivity.create!(
      activity: nil,
      group: nil
    )
  }

  before(:each) do
    assign(:group_activity, group_activity)
  end

  it "renders the edit group_activity form" do
    render

    assert_select "form[action=?][method=?]", group_activity_path(group_activity), "post" do

      assert_select "input[name=?]", "group_activity[activity_id]"

      assert_select "input[name=?]", "group_activity[group_id]"
    end
  end
end
