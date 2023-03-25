require 'rails_helper'

RSpec.describe '/groups', type: :request do
  let(:valid_attributes) do
    { user: User.first, name: 'test', icon: 'Food.jpg' }
  end

  let(:invalid_attributes) do
    { user: nil, name: nil, icon: nil }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Group.create! valid_attributes
      get groups_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      group = Group.create! valid_attributes
      get group_url(group)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_group_url
      expect(response).to be_successful
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested group' do
      group = Group.create! valid_attributes
      expect do
        delete group_url(group)
      end.to change(Group, :count).by(-1)
    end

    it 'redirects to the groups list' do
      group = Group.create! valid_attributes
      delete group_url(group)
      expect(response).to redirect_to(groups_url)
    end
  end
end
