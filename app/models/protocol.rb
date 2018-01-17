class Protocol < ApplicationRecord
  has_many :mice
  has_many :protocol_users
  has_many :users, through: :protocol_users

end
