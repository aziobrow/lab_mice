require 'rails_helper'

RSpec.describe TrackedSubject, type: :model do
  describe "relationships" do

    it "belongs to a user" do
      subject = create(:tracked_subject)
      expect(subject).to respond_to(:user)
    end

    it "belongs to a mouse" do
      subject = create(:tracked_subject)
      expect(subject).to respond_to(:mouse)
    end

    it "has many notes" do
      subject = create(:tracked_subject)
      expect(subject).to respond_to(:notes)
    end
  end
end
