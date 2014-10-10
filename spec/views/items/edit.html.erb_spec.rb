require 'rails_helper'

RSpec.describe "items/edit", :type => :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :description => "MyText",
      :keywords => "MyString",
      :unit_price => "9.99"
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "textarea#item_description[name=?]", "item[description]"

      assert_select "input#item_keywords[name=?]", "item[keywords]"

      assert_select "input#item_unit_price[name=?]", "item[unit_price]"
    end
  end
end
