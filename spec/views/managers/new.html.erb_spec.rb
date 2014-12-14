require 'rails_helper'

RSpec.describe "managers/new", :type => :view do
  before(:each) do
    assign(:manager, Manager.new(
      :gym_name => "MyString"
    ))
  end

  it "renders new manager form" do
    render

    assert_select "form[action=?][method=?]", managers_path, "post" do

      assert_select "input#manager_gym_name[name=?]", "manager[gym_name]"
    end
  end
end
