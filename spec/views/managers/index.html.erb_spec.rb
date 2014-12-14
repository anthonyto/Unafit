require 'rails_helper'

RSpec.describe "managers/index", :type => :view do
  before(:each) do
    assign(:managers, [
      Manager.create!(
        :gym_name => "Gym Name"
      ),
      Manager.create!(
        :gym_name => "Gym Name"
      )
    ])
  end

  it "renders a list of managers" do
    render
    assert_select "tr>td", :text => "Gym Name".to_s, :count => 2
  end
end
