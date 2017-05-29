class Team < ApplicationRecord
  has_attachment :photo
  validates :title, uniqueness: true, presence: true
  validates :description, :photo, :art_types, :location, presence: true
end
