require 'rails_helper'

RSpec.describe "sections/new", type: :view do
  before(:each) do
    @page  = create(:page)
    @section = build(:section, page: @page)
  end

  it "renders new section form" do
    render

    assert_select "form[action=?][method=?]", page_sections_path(@page), "post" do
      assert_select "input[name=?]",    "section[translations_attributes][1][name]"
      assert_select "textarea[name=?]", "section[translations_attributes][1][content]"
    end
  end
end
