require 'rails_helper'

RSpec.describe "order_summaries/show", :type => :view do
  before(:each) do
    @order_summary = assign(:order_summary, OrderSummary.create!(
      :customer_id => 1,
      :total_cost => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/9.99/)
  end
end
