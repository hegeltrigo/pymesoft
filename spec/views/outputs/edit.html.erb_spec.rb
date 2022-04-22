require 'rails_helper'

RSpec.describe "outputs/edit", type: :view do
  before(:each) do
    @output = assign(:output, Output.create!(
      :item => nil,
      :description => "MyText",
      :quantity => 1
    ))
  end

  it "renders the edit output form" do
    render

    assert_select "form[action=?][method=?]", output_path(@output), "post" do

      assert_select "input[name=?]", "output[item_id]"

      assert_select "textarea[name=?]", "output[description]"

      assert_select "input[name=?]", "output[quantity]"
    end
  end
end
