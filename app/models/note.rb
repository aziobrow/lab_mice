class Note < ApplicationRecord
  belongs_to :user
  belongs_to :mouse
  has_many :saved_notes, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :content, presence: true
end
