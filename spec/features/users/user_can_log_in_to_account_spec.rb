require 'rails_helper'

describe "when a user visits the login page" do
  let(:user) { create(:user) }

  before do
    visit login_path
  end

  it "they can log in successfully" do
    fill_in "session[email]", with: "#{user.email}"
    fill_in "session[password]", with: "#{user.password}"
    click_button("Login")

    expect(current_path).to eq(user_dashboard_path)
    expect(page).to have_content("Hi, #{user.first_name}!")
  end

  it "they are notified about incorrect login information" do
    fill_in "session[email]", with: "#{user.email}"
    fill_in "session[password]", with: "incorrect password"
    click_button("Login")

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Username or password does not exist. Please sign up for an account.")
  end
end
