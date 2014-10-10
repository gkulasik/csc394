require 'rails_helper'

RSpec.describe "order_summaries/edit", :type => :view do
  before(:each) do
    @order_summary = assign(:order_summary, OrderSummary.create!(
      :customer_id => 1,
      :total_cost => "9.99"
    ))
  end

  it "renders the edit order_summary form" do
    render

    assert_select "form[action=?][method=?]", order_summary_path(@order_summary), "post" do

      assert_select "input#order_summary_customer_id[name=?]", "order_summary[customer_id]"

      assert_select "input#order_summary_total_cost[name=?]", "order_summary[total_cost]"
    end
  end
end
