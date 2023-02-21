class Entity < ApplicationRecord
  validates :name, presence: true
  validates :amount, numericality: { only_integer: false }
  belongs_to :user
  has_many :entities
  has_many :groups, through: :entity_groups
end
