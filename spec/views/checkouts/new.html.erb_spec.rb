require 'rails_helper'

RSpec.describe "checkouts/new", :type => :view do
  before(:each) do
    assign(:checkout, Checkout.new(
      :card_number => "MyString",
      :csv => "MyString",
      :name_on_card => "MyString",
      :shipping_address => "MyString",
      :shipping_city => "MyString",
      :shipping_state_or_province => "MyString",
      :shipping_postal_code => "MyString",
      :using_account_address => false,
      :verified => false,
      :customer => nil,
      :order_summary => nil
    ))
  end

  it "renders new checkout form" do
    render

    assert_select "form[action=?][method=?]", checkouts_path, "post" do

      assert_select "input#checkout_card_number[name=?]", "checkout[card_number]"

      assert_select "input#checkout_csv[name=?]", "checkout[csv]"

      assert_select "input#checkout_name_on_card[name=?]", "checkout[name_on_card]"

      assert_select "input#checkout_shipping_address[name=?]", "checkout[shipping_address]"

      assert_select "input#checkout_shipping_city[name=?]", "checkout[shipping_city]"

      assert_select "input#checkout_shipping_state_or_province[name=?]", "checkout[shipping_state_or_province]"

      assert_select "input#checkout_shipping_postal_code[name=?]", "checkout[shipping_postal_code]"

      assert_select "input#checkout_using_account_address[name=?]", "checkout[using_account_address]"

      assert_select "input#checkout_verified[name=?]", "checkout[verified]"

      assert_select "input#checkout_customer_id[name=?]", "checkout[customer_id]"

      assert_select "input#checkout_order_summary_id[name=?]", "checkout[order_summary_id]"
    end
  end
end
