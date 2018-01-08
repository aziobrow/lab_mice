require 'rails_helper'

describe "as an authenticated user" do
  it "I can see a list of all mice by original id" do
    create_list(:mouse, 3)
    visit mice_path

    expect(page).to have_css(".mouse", count: 3)
    expect(page).to have_link("#{Mouse.first.original_id}")
    expect(page).to have_link("#{Mouse.second.original_id}")
    expect(page).to have_link("#{Mouse.last.original_id}")
  end

  it "I can navigate to a mouse show page from the mouse id" do
    mouse = create(:mouse)
    visit mice_path

    click_on("#{mouse.original_id}")
    expect(current_path).to eq(mouse_path(mouse.original_id))
  end
end
