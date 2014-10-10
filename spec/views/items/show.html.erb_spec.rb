require 'rails_helper'

RSpec.describe "items/show", :type => :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :description => "MyText",
      :keywords => "Keywords",
      :unit_price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Keywords/)
    expect(rendered).to match(/9.99/)
  end
end
