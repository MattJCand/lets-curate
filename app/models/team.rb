class Team < ApplicationRecord
  has_attachment :photo
  has_many :members, dependent: :destroy
  has_many :tasks
  acts_as_commontable

  validates :title, uniqueness: true, presence: true
  validates :description, :photo, :art_types, presence: true

  geocoded_by :location
  after_validation :geocode #if: :location_changed?
end
