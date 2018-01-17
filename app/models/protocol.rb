class Protocol < ApplicationRecord
  has_many :mice
  has_many :protocol_users
  has_many :users, through: :protocol_users

  before_save :generate_slug

  def generate_slug
    self.slug ||= name.parameterize
  end
  
end
