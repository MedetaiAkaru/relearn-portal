class Tag < ApplicationRecord
  has_many :taggings
  has_many :memberships, through: :taggings

  validates :name, uniqueness: true, length: {minimum: 3}
end
