require 'rails_helper'

RSpec.describe Note, type: :model do
  describe "relationships" do

    it "belongs to a user" do
      note = create(:note)
      expect(note).to respond_to(:user)
    end

    it "belongs to a mouse" do
      note = create(:note)
      expect(note).to respond_to(:mouse)
    end

  end
end
