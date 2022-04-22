require 'rails_helper'

RSpec.describe "outputs/new", type: :view do
  before(:each) do
    assign(:output, Output.new(
      :item => nil,
      :description => "MyText",
      :quantity => 1
    ))
  end

  it "renders new output form" do
    render

    assert_select "form[action=?][method=?]", outputs_path, "post" do

      assert_select "input[name=?]", "output[item_id]"

      assert_select "textarea[name=?]", "output[description]"

      assert_select "input[name=?]", "output[quantity]"
    end
  end
end
