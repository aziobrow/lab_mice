require 'rails_helper'

describe "when a visitor visits the page to create a new account" do

  it "they see a form to enter in account details" do
    visit new_user_path
    expect(page).to have_content("First Name")
    expect(page).to have_content("Last Name")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_content("Confirm Password")
    expect(page).to have_content("Create Account")
  end

end
