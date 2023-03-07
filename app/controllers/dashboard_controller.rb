class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @hobbies = current_user.hobbies
    @users = User.all
  end
end
