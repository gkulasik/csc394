require 'rails_helper'

RSpec.describe "order_summaries/index", :type => :view do
  before(:each) do
    assign(:order_summaries, [
      OrderSummary.create!(
        :customer_id => 1,
        :total_cost => "9.99"
      ),
      OrderSummary.create!(
        :customer_id => 1,
        :total_cost => "9.99"
      )
    ])
  end

  it "renders a list of order_summaries" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
