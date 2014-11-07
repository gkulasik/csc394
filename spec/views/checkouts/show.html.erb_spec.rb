require 'rails_helper'

RSpec.describe "checkouts/show", :type => :view do
  before(:each) do
    @checkout = assign(:checkout, Checkout.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Card Number/)
    expect(rendered).to match(/Csv/)
    expect(rendered).to match(/Name On Card/)
    expect(rendered).to match(/Shipping Address/)
    expect(rendered).to match(/Shipping City/)
    expect(rendered).to match(/Shipping State Or Province/)
    expect(rendered).to match(/Shipping Postal Code/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
