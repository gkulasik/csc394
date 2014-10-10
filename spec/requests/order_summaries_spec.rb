require 'rails_helper'

RSpec.describe "OrderSummaries", :type => :request do
  describe "GET /order_summaries" do
    it "works! (now write some real specs)" do
      get order_summaries_path
      expect(response.status).to be(200)
    end
  end
end
