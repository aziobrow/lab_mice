require 'rails_helper'

describe "when a user visits the login page" do
  it "they can log in" do
    user = create(:user)
    visit login_path
    fill_in "session[email]", with: "#{user.email}"
    fill_in "session[password]", with: "#{user.password}"
    click_button("Login")

    expect(current_path).to eq(user_dashboard_path)
    expect(page).to have_content("Hi, #{user.first_name}!")
  end
end
