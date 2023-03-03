class UserController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
