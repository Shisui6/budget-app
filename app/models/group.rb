class Group < ApplicationRecord
  belongs_to :user
  has_many :group_activities, dependent: :destroy
  has_many :activities, through: :group_activities

  validates :name, :icon, presence: true

  def total
    @total_cost = 0
    group_activities.includes(:activity).each do |a|
      @total_cost += a.activity.amount
    end
    @total_cost
  end
end
