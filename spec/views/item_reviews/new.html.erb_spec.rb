require 'rails_helper'

RSpec.describe "item_reviews/new", :type => :view do
  before(:each) do
    assign(:item_review, ItemReview.new(
      :Item_ID => 1,
      :Rating => 1,
      :Comments => "MyText"
    ))
  end

  it "renders new item_review form" do
    render

    assert_select "form[action=?][method=?]", item_reviews_path, "post" do

      assert_select "input#item_review_Item_ID[name=?]", "item_review[Item_ID]"

      assert_select "input#item_review_Rating[name=?]", "item_review[Rating]"

      assert_select "textarea#item_review_Comments[name=?]", "item_review[Comments]"
    end
  end
end
