require 'rails_helper'

describe "a visitor can sign up for an account" do
  it "they see the link to create a new account from the welcome page" do
    visit '/'
    
    expect(page).to have_link("Create an Account")

    click_on("Create an Account")

    expect(current_path).to eq(new_user_path)
  end


  it 'they can fill out form to create account' do
    visit new_user_path
    fill_in "user[first_name]", with: "Test"
    fill_in "user[last_name]", with: "Test"
    fill_in "user[email]", with: "test@test.com"
    fill_in "user[password]", with: "test"
    fill_in "user[password_confirmation]", with: "test"
    click_on "Create Account"

    expect(current_path).to eq(user_dashboard_path)
  end

end
