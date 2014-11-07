require 'rails_helper'

RSpec.describe "checkouts/index", :type => :view do
  before(:each) do
    assign(:checkouts, [
      Checkout.create!(
        :card_number => "Card Number",
        :csv => "Csv",
        :name_on_card => "Name On Card",
        :shipping_address => "Shipping Address",
        :shipping_city => "Shipping City",
        :shipping_state_or_province => "Shipping State Or Province",
        :shipping_postal_code => "Shipping Postal Code",
        :using_account_address => false,
        :verified => false,
        :customer => nil,
        :order_summary => nil
      ),
      Checkout.create!(
        :card_number => "Card Number",
        :csv => "Csv",
        :name_on_card => "Name On Card",
        :shipping_address => "Shipping Address",
        :shipping_city => "Shipping City",
        :shipping_state_or_province => "Shipping State Or Province",
        :shipping_postal_code => "Shipping Postal Code",
        :using_account_address => false,
        :verified => false,
        :customer => nil,
        :order_summary => nil
      )
    ])
  end

  it "renders a list of checkouts" do
    render
    assert_select "tr>td", :text => "Card Number".to_s, :count => 2
    assert_select "tr>td", :text => "Csv".to_s, :count => 2
    assert_select "tr>td", :text => "Name On Card".to_s, :count => 2
    assert_select "tr>td", :text => "Shipping Address".to_s, :count => 2
    assert_select "tr>td", :text => "Shipping City".to_s, :count => 2
    assert_select "tr>td", :text => "Shipping State Or Province".to_s, :count => 2
    assert_select "tr>td", :text => "Shipping Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
