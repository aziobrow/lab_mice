require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do

    it "has many tracked subjects" do
      user = create(:user)
      expect(user).to respond_to(:tracked_subjects)
    end

    it "has many mice" do
      user = create(:user)
      expect(user).to respond_to(:mice)
    end

  end

  describe "class methods" do
    it "can locate users through oauth uid" do
      auth_hash = {'uid' => '123',
        'info' => {'first_name' => "Test", 'last_name' => "Test", 'email' => 'testing@testing.com'},
        'credentials' => {'token' => 'abc123'}
      }

      user = create(:user, uid: '123')
      expect(user).to eq(User.google_omniauth(auth_hash))
    end

    it "can create new users through oauth uid" do
      auth_hash = {'uid' => '123',
        'info' => {'first_name' => "Test", 'last_name' => "Test", 'email' => 'testing@testing.com'},
        'credentials' => {'token' => 'abc123'}
      }

      expect(User.all.count).to be(0)

      User.google_omniauth(auth_hash)
      user = User.last
      # works in dev but not in this test--user.save is failing
      expect(User.all.count).to eq(1)
      expect(user.first_name).to eq("Test")
      expect(user.last_name).to eq("Test")
      expect(user.email).to eq("testing@testing.com")
      expect(user.uid).to eq("123")
      expect(user.token).to eq("abc123")
    end
  end
end
