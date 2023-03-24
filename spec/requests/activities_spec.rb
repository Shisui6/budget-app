require 'rails_helper'

RSpec.describe '/activities', type: :request do
  let(:group) { Group.create!(user: User.first, name: 'test', icon: 'Food.jpg') }

  let(:valid_attributes) do
    { author_id: User.first.id, name: 'test', amount: 0 }
  end

  let(:invalid_attributes) do
    { user: nil, name: nil, amount: nil }
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get "/groups/#{group.id}/activities/new"
      expect(response).to be_successful
    end
  end
end
