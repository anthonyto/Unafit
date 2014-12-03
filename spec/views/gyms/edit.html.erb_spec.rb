require 'rails_helper'

RSpec.describe "gyms/edit", :type => :view do
  before(:each) do
    @gym = assign(:gym, Gym.create!(
      :name => "MyString",
      :email => "MyString",
      :phone_number => "MyString",
      :city => "MyString",
      :state => "MyString",
      :street => "MyString",
      :lat => "9.99",
      :lng => "9.99",
      :two_gym_passes => 1,
      :three_gym_passes => 1,
      :four_gym_passes => 1,
      :status => "MyString",
      :description => "MyText",
      :link => "MyString",
      :profile_image => "MyString",
      :logo_image => "MyString",
      :showers => false,
      :classes => "MyText",
      :reservation_policy => "MyText"
    ))
  end

  it "renders the edit gym form" do
    render

    assert_select "form[action=?][method=?]", gym_path(@gym), "post" do

      assert_select "input#gym_name[name=?]", "gym[name]"

      assert_select "input#gym_email[name=?]", "gym[email]"

      assert_select "input#gym_phone_number[name=?]", "gym[phone_number]"

      assert_select "input#gym_city[name=?]", "gym[city]"

      assert_select "input#gym_state[name=?]", "gym[state]"

      assert_select "input#gym_street[name=?]", "gym[street]"

      assert_select "input#gym_lat[name=?]", "gym[lat]"

      assert_select "input#gym_lng[name=?]", "gym[lng]"

      assert_select "input#gym_two_gym_passes[name=?]", "gym[two_gym_passes]"

      assert_select "input#gym_three_gym_passes[name=?]", "gym[three_gym_passes]"

      assert_select "input#gym_four_gym_passes[name=?]", "gym[four_gym_passes]"

      assert_select "input#gym_status[name=?]", "gym[status]"

      assert_select "textarea#gym_description[name=?]", "gym[description]"

      assert_select "input#gym_link[name=?]", "gym[link]"

      assert_select "input#gym_profile_image[name=?]", "gym[profile_image]"

      assert_select "input#gym_logo_image[name=?]", "gym[logo_image]"

      assert_select "input#gym_showers[name=?]", "gym[showers]"

      assert_select "textarea#gym_classes[name=?]", "gym[classes]"

      assert_select "textarea#gym_reservation_policy[name=?]", "gym[reservation_policy]"
    end
  end
end
