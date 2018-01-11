require 'rails_helper'

describe "as an authenticated user" do
  let!(:tracked_mouse) { create(:mouse) }

  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit mouse_path(tracked_mouse.original_id)
  end

  it "I can see the option to track a mouse" do
    expect(page).to have_css(".unfavorited")
  end

  it "I can see tracked mouse on my dashboard" do
    click_link("Unfavorite star")
    visit user_dashboard_path

    expect(page).to have_link("#{tracked_mouse.original_id}")
    expect(page).to have_css(".favorite-mouse", 1)
    expect(page).to have_link("Untrack")
  end

  it "I can untrack a mouse from my dashboard" do
    click_link("Unfavorite star")
    visit user_dashboard_path
    click_on "Untrack"

    expect(current_path).to eq(user_dashboard_path)
    expect(page).to have_content("Mouse ##{tracked_mouse.original_id} successfully untracked")
  end

  it "I can untrack a mouse from a mouse show page" do
    click_link("Unfavorite star")

    expect(current_path).to eq(mouse_path(tracked_mouse.original_id))
    expect(page).to have_css(".favorited")

    click_link("Favorite star")

    expect(page).to have_content("Mouse ##{tracked_mouse.original_id} successfully untracked")
    expect(page).to have_css(".unfavorited")

    visit user_dashboard_path

    expect(page).to_not have_css(".favorite-mouse")
  end
end
