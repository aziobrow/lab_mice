class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :note

  scope :unread, ->{where read: false}
end
