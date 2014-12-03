require 'rails_helper'

RSpec.describe "gyms/show", :type => :view do
  before(:each) do
    @gym = assign(:gym, Gym.create!(
      :name => "Name",
      :email => "Email",
      :phone_number => "Phone Number",
      :city => "City",
      :state => "State",
      :street => "Street",
      :lat => "9.99",
      :lng => "9.99",
      :2_gym_passes => "",
      :3_gym_passes => "",
      :4_gym_passes => "",
      :status => "Status",
      :description => "MyText",
      :link => "Link",
      :profile_image => "Profile Image",
      :logo_image => "Logo Image",
      :showers => false,
      :classes => "MyText",
      :reservation_policy => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(/Profile Image/)
    expect(rendered).to match(/Logo Image/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
