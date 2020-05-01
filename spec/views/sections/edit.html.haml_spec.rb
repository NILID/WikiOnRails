require 'rails_helper'

RSpec.describe "pages/1/sections/edit", type: :view do
  before(:each) do
    @section = create(:section)
  end

  it "renders the edit section form" do
    render

    assert_select "form[action=?][method=?]", page_section_path(@section.page, @section), "post" do

      assert_select "input[name=?]", "section[page_id]"

      assert_select "input[name=?]", "section[position]"
    end
  end
end
