require 'rails_helper'

RSpec.describe "customers/show", :type => :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :name => "Name",
      :address => "Address",
      :city => "City",
      :state_province => "State Province",
      :postal_code => "Postal Code",
      :country => "Country",
      :phone_number => "Phone Number",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State Province/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Email/)
  end
end
