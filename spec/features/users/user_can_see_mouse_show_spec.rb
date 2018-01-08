require 'rails_helper'

describe "as an authenticated user" do
  let(:mouse)  { create(:mouse) }
  let(:user)  { create(:user) }
  let(:note)  { create(:note, mouse: mouse)}

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit mouse_path(mouse.original_id)
  end

  it "I can see details for a single mouse" do
    expect(page).to have_content("Mouse ##{mouse.original_id}")
    expect(page).to have_content("Trisomic: #{mouse.trisomic}")
    expect(page).to have_content("Protein(ug/ml): #{mouse.protein_ug_per_ml}")
    expect(page).to have_content("Diet: #{mouse.diet}")
    expect(page).to have_content("Color: #{mouse.color}")
    expect(page).to have_content("Sex: #{mouse.sex}")
    expect(page).to have_content("Date of Birth: #{mouse.date_of_birth}")
    expect(page).to have_content("Experiment Start Date: #{mouse.experiment_start_date}")
    expect(page).to have_content("Harvest Date: #{mouse.harvest_date}")
    expect(page).to have_content("Group Number: #{mouse.group_number}")
    expect(page).to have_content("Harvest Brain Temperature Read: #{mouse.harvest_brain_temp}")
    expect(page).to have_content("Weight(g): #{mouse.weight_in_grams}")
    expect(page).to have_content("Status: #{mouse.status}")
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
    expect(page).to have_content("Your Note")
    expect(page).to have_css("#note_content")
    expect(page).to have_button("Add Note")
  end
end
