class Activity < ApplicationRecord
  belongs_to :user
  has_many :group_activities, dependent: :destroy
  has_many :groups, through: :group_activities
end
