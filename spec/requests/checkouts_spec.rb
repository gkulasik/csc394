require 'rails_helper'

RSpec.describe "Checkouts", :type => :request do
  describe "GET /checkouts" do
    it "works! (now write some real specs)" do
      get checkouts_path
      expect(response.status).to be(200)
    end
  end
end
