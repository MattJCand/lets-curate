class Team < ApplicationRecord
  has_attachment :photo

  has_many :members
  validates :title, uniqueness: true, presence: true
  validates :description, :photo, :art_types, :location, presence: true

end
