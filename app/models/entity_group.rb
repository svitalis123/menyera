class EntityGroup < ApplicationRecord
  belongs_to :entity
  belongs_to :group
  validates :amount, presence: true
end
