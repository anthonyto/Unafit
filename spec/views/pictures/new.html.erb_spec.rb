require 'rails_helper'

RSpec.describe "pictures/new", :type => :view do
  before(:each) do
    assign(:picture, Picture.new(
      :file_name => "MyString",
      :gym => nil
    ))
  end

  it "renders new picture form" do
    render

    assert_select "form[action=?][method=?]", pictures_path, "post" do

      assert_select "input#picture_file_name[name=?]", "picture[file_name]"

      assert_select "input#picture_gym_id[name=?]", "picture[gym_id]"
    end
  end
end
