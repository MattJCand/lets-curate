class Team < ApplicationRecord
  has_attachment :photo
  has_many :members
end
