class TrackedSubject < ApplicationRecord
  belongs_to :user
  belongs_to :mouse
end
