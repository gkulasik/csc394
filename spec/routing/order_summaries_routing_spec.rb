require "rails_helper"

RSpec.describe OrderSummariesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/order_summaries").to route_to("order_summaries#index")
    end

    it "routes to #new" do
      expect(:get => "/order_summaries/new").to route_to("order_summaries#new")
    end

    it "routes to #show" do
      expect(:get => "/order_summaries/1").to route_to("order_summaries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/order_summaries/1/edit").to route_to("order_summaries#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/order_summaries").to route_to("order_summaries#create")
    end

    it "routes to #update" do
      expect(:put => "/order_summaries/1").to route_to("order_summaries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/order_summaries/1").to route_to("order_summaries#destroy", :id => "1")
    end

  end
end
