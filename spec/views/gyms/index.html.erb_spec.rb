require 'rails_helper'

RSpec.describe "gyms/index", :type => :view do
  before(:each) do
    assign(:gyms, [
      Gym.create!(
        :name => "Name",
        :email => "Email",
        :phone_number => "Phone Number",
        :city => "City",
        :state => "State",
        :street => "Street",
        :lat => "9.99",
        :lng => "9.99",
        :two_gym_passes => 1,
        :three_gym_passes => 2,
        :four_gym_passes => 3,
        :status => "Status",
        :description => "MyText",
        :link => "Link",
        :profile_image => "Profile Image",
        :logo_image => "Logo Image",
        :showers => false,
        :classes => "MyText",
        :reservation_policy => "MyText"
      ),
      Gym.create!(
        :name => "Name",
        :email => "Email",
        :phone_number => "Phone Number",
        :city => "City",
        :state => "State",
        :street => "Street",
        :lat => "9.99",
        :lng => "9.99",
        :two_gym_passes => 1,
        :three_gym_passes => 2,
        :four_gym_passes => 3,
        :status => "Status",
        :description => "MyText",
        :link => "Link",
        :profile_image => "Profile Image",
        :logo_image => "Logo Image",
        :showers => false,
        :classes => "MyText",
        :reservation_policy => "MyText"
      )
    ])
  end

  it "renders a list of gyms" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "Profile Image".to_s, :count => 2
    assert_select "tr>td", :text => "Logo Image".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
