class GroupActivity < ApplicationRecord
  belongs_to :activity
  belongs_to :group
end
