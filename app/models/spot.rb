class Spot < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  # geocoded_by :address
  # after_validation :geocode, if: :address_changed?
  
  validates :title, presence: true
  validates :description, presence: true
  validates :adress, presence: true
  validates :image, presence: true
  validates :price, presence: true

  
end