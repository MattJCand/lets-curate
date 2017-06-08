class Team < ApplicationRecord
  has_attachment :photo
  has_many :members, dependent: :destroy
  has_many :tasks

  validates :title, uniqueness: true, presence: true
  validates :description, :photo, :art_types, :date, presence: true
end
