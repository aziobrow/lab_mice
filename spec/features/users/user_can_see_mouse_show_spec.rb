describe "as an authenticated user" do
  it "I can see details for a single mouse" do
    mouse = create(:mouse)
    visit mouse_path(mouse.original_id)

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
end
