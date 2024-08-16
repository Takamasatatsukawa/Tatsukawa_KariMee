class HomeController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:top]



  def top
    flash[:notice] = "Welcome to the top page!"
  end
  
  def hunting_ground
    # 狩場ページのロジック
  end
end