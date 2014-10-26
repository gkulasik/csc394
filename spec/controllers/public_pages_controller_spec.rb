require 'rails_helper'

RSpec.describe PublicPagesController, :type => :controller do

  describe "GET home" do
    it "returns http success" do
      get :home
      expect(response).to be_success
    end
  end

  describe "GET about" do
    it "returns http success" do
      get :about
      expect(response).to be_success
    end
  end

  describe "GET privacy_policy" do
    it "returns http success" do
      get :privacy_policy
      expect(response).to be_success
    end
  end

end
