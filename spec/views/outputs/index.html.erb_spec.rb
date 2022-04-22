require 'rails_helper'

RSpec.describe "outputs/index", type: :view do
  before(:each) do
    assign(:outputs, [
      Output.create!(
        :item => nil,
        :description => "MyText",
        :quantity => 2
      ),
      Output.create!(
        :item => nil,
        :description => "MyText",
        :quantity => 2
      )
    ])
  end

  it "renders a list of outputs" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
