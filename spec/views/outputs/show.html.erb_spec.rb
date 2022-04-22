require 'rails_helper'

RSpec.describe "outputs/show", type: :view do
  before(:each) do
    @output = assign(:output, Output.create!(
      :item => nil,
      :description => "MyText",
      :quantity => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
