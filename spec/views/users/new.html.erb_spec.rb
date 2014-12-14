require 'rails_helper'

RSpec.describe "users/new", :type => :view do
  before(:each) do
    assign(:user, User.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone_number => "MyString",
      :city => "MyString",
      :state => "MyString",
      :street => "MyString",
      :zip => "MyString",
      :lat => "9.99",
      :lng => "9.99",
      :type => "",
      :number_of_sessions => 1
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_first_name[name=?]", "user[first_name]"

      assert_select "input#user_last_name[name=?]", "user[last_name]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_phone_number[name=?]", "user[phone_number]"

      assert_select "input#user_city[name=?]", "user[city]"

      assert_select "input#user_state[name=?]", "user[state]"

      assert_select "input#user_street[name=?]", "user[street]"

      assert_select "input#user_zip[name=?]", "user[zip]"

      assert_select "input#user_lat[name=?]", "user[lat]"

      assert_select "input#user_lng[name=?]", "user[lng]"

      assert_select "input#user_type[name=?]", "user[type]"

      assert_select "input#user_number_of_sessions[name=?]", "user[number_of_sessions]"
    end
  end
end
