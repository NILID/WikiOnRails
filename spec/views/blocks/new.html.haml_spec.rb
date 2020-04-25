require 'rails_helper'

RSpec.describe "blocks/new", type: :view do
  before(:each) do
    assign(:block, Block.new(
      page: nil,
      position: 1
    ))
  end

  it "renders new block form" do
    render

    assert_select "form[action=?][method=?]", blocks_path, "post" do

      assert_select "input[name=?]", "block[page_id]"

      assert_select "input[name=?]", "block[position]"
    end
  end
end
