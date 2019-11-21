class Character < ApplicationRecord
  has_one :status
  has_many :character_users, dependent: :destroy
  has_many :users, through: :character_users
  accepts_nested_attributes_for :status, allow_destroy: true
end
