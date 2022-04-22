require 'rails_helper'

RSpec.describe "inputs/edit", type: :view do
  before(:each) do
    @input = assign(:input, Input.create!(
      :item => nil,
      :description => "MyText",
      :quantity => 1
    ))
  end

  it "renders the edit input form" do
    render

    assert_select "form[action=?][method=?]", input_path(@input), "post" do

      assert_select "input[name=?]", "input[item_id]"

      assert_select "textarea[name=?]", "input[description]"

      assert_select "input[name=?]", "input[quantity]"
    end
  end
end
