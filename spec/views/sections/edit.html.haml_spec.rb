require 'rails_helper'

RSpec.describe "sections/edit", type: :view do
  before(:each) do
    @page  = create(:page)
    @section = create(:section, page: @page)
  end

  it "renders the edit section form" do
    render

    assert_select "form[action=?][method=?]", page_section_path(@page, @section), "post" do
      assert_select "input[name=?]",    "section[translations_attributes][1][name]"
      assert_select "textarea[name=?]", "section[translations_attributes][1][content]"
    end
  end
end
