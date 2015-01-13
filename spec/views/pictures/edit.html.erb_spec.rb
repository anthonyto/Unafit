require 'rails_helper'

RSpec.describe "pictures/edit", :type => :view do
  before(:each) do
    @picture = assign(:picture, Picture.create!(
      :file_name => "MyString",
      :gym => nil
    ))
  end

  it "renders the edit picture form" do
    render

    assert_select "form[action=?][method=?]", picture_path(@picture), "post" do

      assert_select "input#picture_file_name[name=?]", "picture[file_name]"

      assert_select "input#picture_gym_id[name=?]", "picture[gym_id]"
    end
  end
end
