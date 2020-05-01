require 'rails_helper'

RSpec.describe "pages/1/sections/new", type: :view do
  before(:each) do
    assign(:section, build_stubbed(:section))
  end

  it "renders new section form" do
    render

    assert_select "form[action=?][method=?]", sections_path, "post" do

      assert_select "input[name=?]", "section[page_id]"

      assert_select "input[name=?]", "section[position]"
    end
  end
end
