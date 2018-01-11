require 'rails_helper'

describe "as an authenticated user" do
  let(:user) { create(:user)  }
  let(:mouse) { create(:mouse) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/'
    fill_in "search", :with => "#{mouse.original_id}"
    click_on "Search"
  end

  context "I can search for a mouse by its original id" do

    it "and see all relevant information about a mouse" do
      expect(current_path).to eq(mouse_path(mouse.original_id))
      expect(page).to have_content("#{mouse.original_id}")
      expect(page).to have_content("#{mouse.trisomic.to_s.titleize}")
      expect(page).to have_content("#{mouse.protein_ug_per_ml}")
      expect(page).to have_content("#{mouse.diet.titleize}")
      expect(page).to have_content("#{mouse.color.titleize}")
      expect(page).to have_content("#{mouse.sex.titleize}")
      expect(page).to have_content("#{mouse.date_of_birth}")
      expect(page).to have_content("#{mouse.experiment_start_date}")
      expect(page).to have_content("#{mouse.harvest_date}")
      expect(page).to have_content("#{mouse.group_number}")
      expect(page).to have_content("#{mouse.harvest_brain_temp}")
      expect(page).to have_content("#{mouse.weight_in_grams}")
      expect(page).to have_content("#{mouse.status.titleize}")
    end

  end
end
