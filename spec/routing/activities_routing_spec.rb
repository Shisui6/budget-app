require 'rails_helper'

RSpec.describe ActivitiesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/groups/1/activities').to route_to('activities#index', group_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/groups/1/activities/new').to route_to('activities#new', group_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/groups/1/activities/1').to route_to('activities#show', group_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/groups/1/activities/1/edit').to route_to('activities#edit', group_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/groups/1/activities').to route_to('activities#create', group_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/groups/1/activities/1').to route_to('activities#update', group_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/groups/1/activities/1').to route_to('activities#update', group_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/groups/1/activities/1').to route_to('activities#destroy', group_id: '1', id: '1')
    end
  end
end
