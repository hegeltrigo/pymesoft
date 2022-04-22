require 'rails_helper'

RSpec.describe "invoice_dosages/edit", type: :view do
  before(:each) do
    @invoice_dosage = assign(:invoice_dosage, InvoiceDosage.create!(
      :authorization_number => "MyString",
      :invoice_initial_number => 1,
      :dosage_key => "MyString",
      :economic_activity => "MyString",
      :active => false
    ))
  end

  it "renders the edit invoice_dosage form" do
    render

    assert_select "form[action=?][method=?]", invoice_dosage_path(@invoice_dosage), "post" do

      assert_select "input[name=?]", "invoice_dosage[authorization_number]"

      assert_select "input[name=?]", "invoice_dosage[invoice_initial_number]"

      assert_select "input[name=?]", "invoice_dosage[dosage_key]"

      assert_select "input[name=?]", "invoice_dosage[economic_activity]"

      assert_select "input[name=?]", "invoice_dosage[active]"
    end
  end
end
