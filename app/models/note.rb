class Note < ApplicationRecord
  belongs_to :user
  belongs_to :mouse
  validates :content, presence: true
end
