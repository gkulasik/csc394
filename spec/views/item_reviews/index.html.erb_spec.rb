require 'rails_helper'

RSpec.describe "item_reviews/index", :type => :view do
  before(:each) do
    assign(:item_reviews, [
      ItemReview.create!(
        :Item_ID => 1,
        :Rating => 2,
        :Comments => "MyText"
      ),
      ItemReview.create!(
        :Item_ID => 1,
        :Rating => 2,
        :Comments => "MyText"
      )
    ])
  end

  it "renders a list of item_reviews" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
