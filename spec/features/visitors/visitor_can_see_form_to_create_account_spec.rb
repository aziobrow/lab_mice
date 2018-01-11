require 'rails_helper'

describe "when a visitor visits the page to create a new account" do

  it "they see a form to enter in account details" do
    visit new_user_path
    expect(page).to have_css("#user_first_name")
    expect(page).to have_css("#user_last_name")
    expect(page).to have_css("#user_email")
    expect(page).to have_css("#user_password")
    expect(page).to have_css("#user_password_confirmation")
    expect(page).to have_content("Create Account")
    expect(page).to have_content("Create Account with Google")
    expect(page).to have_content("Login")
  end

end
