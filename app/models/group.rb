class Group < ApplicationRecord
  belongs_to :user
  has_many :group_activities, dependent: :destroy
  has_many :activities, through: :group_activities
end
