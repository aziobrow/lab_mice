require 'rails_helper'

describe "as an authenticated user" do
  let(:mouse)  { create(:mouse) }
  let(:user)  { create(:user) }
  let!(:note)  { create(:note, mouse: mouse)}

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit mouse_path(mouse.lab_id)
  end

  it "I can see details for a single mouse" do
    expect(page).to have_content("Mouse ##{mouse.lab_id}")
    expect(page).to have_content("#{mouse.ploidy.titleize}")
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

  it "I can see notes for this mouse" do
    #works in dev but not test
    expect(page).to have_content("Lab Notes (1)")
    expect(page).to have_content("#{note.content}")
    expect(page).to have_content("#{note.user.first_name}")
    expect(page).to have_content("#{note.user.last_name}")
    expect(page).to have_content("Note added on")
  end

  it "I can see a form to add a new note" do
    expect(page).to have_content("Add a Note")
    expect(page).to have_css("#note_content")
    expect(page).to have_button("Add Note")
  end
end
