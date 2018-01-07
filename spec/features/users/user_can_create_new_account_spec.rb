require 'rails_helper'

describe "when a user signs up for an account" do
  before do
    visit '/'
  end

  it "they see the link to create a new account from the welcome page" do
    expect(page).to have_link("Log In Or Sign Up Using Google")
    click_on("Log In Or Sign Up Using Google")
  end

end
