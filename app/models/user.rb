class User < ApplicationRecord
  has_secure_password(validations: false)
  has_many :tracked_subjects
  has_many :mice, through: :tracked_subjects

  def self.google_omniauth(auth)
    user = User.find_or_create_by(uid: auth['uid'])
      user.first_name = auth['info']['first_name']
      user.last_name = auth['info']['last_name']
      user.email = auth['info']['email']
      user.uid = auth['uid']
      user.token = auth['credentials']['token']
      user.save!
      return user
  end
end
