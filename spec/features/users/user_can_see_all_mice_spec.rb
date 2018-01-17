require 'rails_helper'

describe "as an authenticated user" do
  let(:user)  { create(:user) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "I can see a list of all mice by lab id" do
    create_list(:mouse, 3)
    visit mice_path

    expect(page).to have_css(".index-mouse", count: 3)
    expect(page).to have_link("#{Mouse.first.lab_id}")
    expect(page).to have_link("#{Mouse.second.lab_id}")
    expect(page).to have_link("#{Mouse.last.lab_id}")
  end

  it "I can navigate to a mouse show page from the mouse id" do
    mouse = create(:mouse)
    visit mice_path

    click_on("#{mouse.lab_id}")
    expect(current_path).to eq(mouse_path(mouse.lab_id))
  end
end
