require 'rails_helper'

RSpec.describe "blocks/edit", type: :view do
  before(:each) do
    @block = assign(:block, Block.create!(
      page: nil,
      position: 1
    ))
  end

  it "renders the edit block form" do
    render

    assert_select "form[action=?][method=?]", block_path(@block), "post" do

      assert_select "input[name=?]", "block[page_id]"

      assert_select "input[name=?]", "block[position]"
    end
  end
end
