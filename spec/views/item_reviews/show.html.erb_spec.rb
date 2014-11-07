require 'rails_helper'

RSpec.describe "item_reviews/show", :type => :view do
  before(:each) do
    @item_review = assign(:item_review, ItemReview.create!(
      :Item_ID => 1,
      :Rating => 2,
      :Comments => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
