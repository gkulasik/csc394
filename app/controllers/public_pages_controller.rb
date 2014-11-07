class PublicPagesController < ApplicationController
  
  skip_before_action :is_logged_in, :is_admin
  
  def home
  end

  def about
  end

  def privacy_policy
  end
end
