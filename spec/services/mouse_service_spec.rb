require 'rails_helper'

describe "service returns raw mouse info" do
  before do
    service = MouseService.new({trisomic: "false", diet: "rapamycin"})
    @results = service.find_mice
    @mouse_result = @results.first
  end

  it "makes a successful api request" do
    expect(@results).to be_an Array
    expect(@mouse_result).to be_a Hash
    expect(@results.count).to eq(40)
  end

  it "includes relevant details about each store" do
    expect(@mouse_result).to have_key(:original_id)
    expect(@mouse_result).to have_key(:trisomic)
    expect(@mouse_result).to have_key(:diet)
  end
end
