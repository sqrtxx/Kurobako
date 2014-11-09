class MainPageController < ApplicationController
  def index
    @users = User.recent.limit(10)
  end
end
