class Review < ApplicationRecord
  validates :comment, presence: true, length: { minimum: 2 }
  belongs_to :member
end
