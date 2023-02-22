class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true
  belongs_to :user
  has_many :entity_groups
  has_many :entities, through: :entity_groups
end
