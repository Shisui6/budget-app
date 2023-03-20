require 'rails_helper'

RSpec.describe 'activities/edit', type: :view do
  let(:activity) do
    Activity.create!(
      name: 'MyString',
      amount: 1.5,
      user: nil
    )
  end

  before(:each) do
    assign(:activity, activity)
  end

  it 'renders the edit activity form' do
    render

    assert_select 'form[action=?][method=?]', activity_path(activity), 'post' do
      assert_select 'input[name=?]', 'activity[name]'

      assert_select 'input[name=?]', 'activity[amount]'

      assert_select 'input[name=?]', 'activity[user_id]'
    end
  end
end
