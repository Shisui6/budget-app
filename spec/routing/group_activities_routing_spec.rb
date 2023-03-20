require 'rails_helper'

RSpec.describe GroupActivitiesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/group_activities').to route_to('group_activities#index')
    end

    it 'routes to #new' do
      expect(get: '/group_activities/new').to route_to('group_activities#new')
    end

    it 'routes to #show' do
      expect(get: '/group_activities/1').to route_to('group_activities#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/group_activities/1/edit').to route_to('group_activities#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/group_activities').to route_to('group_activities#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/group_activities/1').to route_to('group_activities#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/group_activities/1').to route_to('group_activities#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/group_activities/1').to route_to('group_activities#destroy', id: '1')
    end
  end
end
