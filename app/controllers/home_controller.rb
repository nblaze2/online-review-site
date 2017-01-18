class HomeController < ApplicationController
  def index
    redirect_to '/movies'
  end
end
