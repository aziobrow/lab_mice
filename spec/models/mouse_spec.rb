require 'rails_helper'

RSpec.describe Mouse, type: :model do
  describe "relationships" do

    it "has many tracked subjects" do
      mouse = create(:mouse)
      expect(mouse).to respond_to(:tracked_subjects)
    end

    it "has many users" do
      mouse = create(:mouse)
      expect(mouse).to respond_to(:users)
    end

    it "has many notes" do
      mouse = create(:mouse)
      expect(mouse).to respond_to(:notes)
    end

  end
end
