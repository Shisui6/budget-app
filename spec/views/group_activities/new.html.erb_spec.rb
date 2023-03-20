require 'rails_helper'

RSpec.describe 'group_activities/new', type: :view do
  before(:each) do
    assign(:group_activity, GroupActivity.new(
                              activity: nil,
                              group: nil
                            ))
  end

  it 'renders new group_activity form' do
    render

    assert_select 'form[action=?][method=?]', group_activities_path, 'post' do
      assert_select 'input[name=?]', 'group_activity[activity_id]'

      assert_select 'input[name=?]', 'group_activity[group_id]'
    end
  end
end
