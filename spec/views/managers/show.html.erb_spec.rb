require 'rails_helper'

RSpec.describe "managers/show", :type => :view do
  before(:each) do
    @manager = assign(:manager, Manager.create!(
      :gym_name => "Gym Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Gym Name/)
  end
end
