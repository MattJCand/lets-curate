class Member < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_many :tasks, dependent: :destroy
end
