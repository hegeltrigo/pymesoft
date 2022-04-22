require 'rails_helper'

RSpec.describe "inputs/new", type: :view do
  before(:each) do
    assign(:input, Input.new(
      :item => nil,
      :description => "MyText",
      :quantity => 1
    ))
  end

  it "renders new input form" do
    render

    assert_select "form[action=?][method=?]", inputs_path, "post" do

      assert_select "input[name=?]", "input[item_id]"

      assert_select "textarea[name=?]", "input[description]"

      assert_select "input[name=?]", "input[quantity]"
    end
  end
end
