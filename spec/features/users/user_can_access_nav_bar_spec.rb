require 'rails_helper'

describe "when a user accesses the site via the nav bar" do
  let(:user) { create(:user)  }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_dashboard_path
  end

  it "they can get to all mice" do
    click_on("All Mice")

    expect(current_path).to eq(mice_path)
  end

  it "they can get to tracked subjects" do
    click_on("My Subjects")

    expect(current_path).to eq(user_dashboard_path)
  end

  it "they can access analytics" do
    click_on("Analytics")

    expect(current_path).to eq(user_analytics_path)
  end
end
