class SavedNote < ApplicationRecord
  belongs_to :note
  belongs_to :user
end
