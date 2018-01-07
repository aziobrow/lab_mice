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
end
