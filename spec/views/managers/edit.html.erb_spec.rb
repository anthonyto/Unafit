require 'rails_helper'

RSpec.describe "managers/edit", :type => :view do
  before(:each) do
    @manager = assign(:manager, Manager.create!(
      :gym_name => "MyString"
    ))
  end

  it "renders the edit manager form" do
    render

    assert_select "form[action=?][method=?]", manager_path(@manager), "post" do

      assert_select "input#manager_gym_name[name=?]", "manager[gym_name]"
    end
  end
end
