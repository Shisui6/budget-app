class Activity < ApplicationRecord
  belongs_to :user
  has_many :group_activities, dependent: :destroy
  has_many :groups, through: :group_activities

  validates :name, :amount, presence: true
  validates :amount, comparison: { greater_than_or_equal_to: 0 }
end
