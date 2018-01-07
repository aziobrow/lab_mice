require 'rails_helper'

describe "when a user visits the login page" do
  it "they see a form to log in" do
    visit login_path

    expect(page).to have_content("Log In")
    expect(page).to have_content("Login with Google")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_button("Login")
    expect(page).to have_link("Create Account")
  end

  it "they can access new account page through login page" do
    visit login_path
    click_on("Create Account")

    expect(current_path).to eq(new_user_path)  
  end
end
