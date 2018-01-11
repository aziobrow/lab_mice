require 'rails_helper'

describe "mouse presenter returns mice" do
  before do
    presenter = MousePresenter.new({diet: 'rapamycin', trisomic: 'false'})
    @mice = presenter.mice
  end

  it "finds mice on raw data from service" do
    expect(@mice).to be_an Array
    expect(@mice.count).to eq(40)
  end

end
