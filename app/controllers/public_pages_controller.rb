class PublicPagesController < ApplicationController
  
  skip_before_action :is_logged_in, :is_admin
  
  def home
    array = []
    stop =5
    Item.all.each do |i|
      if !i.images.empty?
        array.push(i)
        stop -=1
      end
      if stop <=0
        break
      end
    end
    @items = array
  end

  def about
  end

  def privacy_policy
  end
end
