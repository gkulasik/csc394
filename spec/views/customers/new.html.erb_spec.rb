require 'rails_helper'

RSpec.describe "customers/new", :type => :view do
  before(:each) do
    assign(:customer, Customer.new(
      :name => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state_province => "MyString",
      :postal_code => "MyString",
      :country => "MyString",
      :phone_number => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new customer form" do
    render

    assert_select "form[action=?][method=?]", customers_path, "post" do

      assert_select "input#customer_name[name=?]", "customer[name]"

      assert_select "input#customer_address[name=?]", "customer[address]"

      assert_select "input#customer_city[name=?]", "customer[city]"

      assert_select "input#customer_state_province[name=?]", "customer[state_province]"

      assert_select "input#customer_postal_code[name=?]", "customer[postal_code]"

      assert_select "input#customer_country[name=?]", "customer[country]"

      assert_select "input#customer_phone_number[name=?]", "customer[phone_number]"

      assert_select "input#customer_email[name=?]", "customer[email]"
    end
  end
end
