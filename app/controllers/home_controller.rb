class HomeController < ApplicationController
  def index
    redirect_to '/movies'
  end

  def faq
    redirect_to '/about'
  end
end
