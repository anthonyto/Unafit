require 'rails_helper'

RSpec.describe "pictures/index", :type => :view do
  before(:each) do
    assign(:pictures, [
      Picture.create!(
        :file_name => "File Name",
        :gym => nil
      ),
      Picture.create!(
        :file_name => "File Name",
        :gym => nil
      )
    ])
  end

  it "renders a list of pictures" do
    render
    assert_select "tr>td", :text => "File Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
