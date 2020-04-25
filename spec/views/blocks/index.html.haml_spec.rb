require 'rails_helper'

RSpec.describe "blocks/index", type: :view do
  before(:each) do
    assign(:blocks, [
      Block.create!(
        page: nil,
        position: 2
      ),
      Block.create!(
        page: nil,
        position: 2
      )
    ])
  end

  it "renders a list of blocks" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
