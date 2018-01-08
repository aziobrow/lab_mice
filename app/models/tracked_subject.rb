class TrackedSubject < ApplicationRecord
  belongs_to :user
  belongs_to :mouse
  has_many :notes, through: :mice
end
