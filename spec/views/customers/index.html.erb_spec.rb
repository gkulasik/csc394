require 'rails_helper'

RSpec.describe "customers/index", :type => :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        :name => "Name",
        :address => "Address",
        :city => "City",
        :state_province => "State Province",
        :postal_code => "Postal Code",
        :country => "Country",
        :phone_number => "Phone Number",
        :email => "Email"
      ),
      Customer.create!(
        :name => "Name",
        :address => "Address",
        :city => "City",
        :state_province => "State Province",
        :postal_code => "Postal Code",
        :country => "Country",
        :phone_number => "Phone Number",
        :email => "Email"
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State Province".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
