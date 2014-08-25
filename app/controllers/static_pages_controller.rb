class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    # @time = Time.now.to_s
    @photos = ["/images/beer.jpg","/images/curry.jpg","/images/dou.jpg", "/images/ferry.jpg","/images/kindai.jpg", "/images/kuma.jpg","/images/tomoro.jpg","/images/mtrishiri.jpg"].shuffle
  end

  def help
  end

  def about
  end

  def contact
  end

  def search
  end

end
