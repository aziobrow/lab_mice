require 'rails_helper'

describe "as an authenticated user" do
  let(:mouse)  { create(:mouse) }
  let(:user)  { create(:user) }
  let(:alt_user)  { create(:user) }

  it "I can add lab notes to a mouse" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit mouse_path(mouse.original_id)

    fill_in "note[content]", with: "Testing"
    click_on("Add Note")

    expect(page).to have_content("Note added on")
    expect(page).to have_content("by #{user.first_name} #{user.last_name}")
  end

  it "other users can see my notes" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit mouse_path(mouse.original_id)

    fill_in "note[content]", with: "Testing"
    click_on("Add Note")
    click_link("Logout")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(alt_user)
    visit mouse_path(mouse.original_id)

    expect(page).to have_content("Note added on")
    expect(page).to have_content("by #{user.first_name} #{user.last_name}")
  end
end
