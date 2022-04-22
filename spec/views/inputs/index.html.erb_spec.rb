require 'rails_helper'

RSpec.describe "inputs/index", type: :view do
  before(:each) do
    assign(:inputs, [
      Input.create!(
        :item => nil,
        :description => "MyText",
        :quantity => 2
      ),
      Input.create!(
        :item => nil,
        :description => "MyText",
        :quantity => 2
      )
    ])
  end

  it "renders a list of inputs" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
