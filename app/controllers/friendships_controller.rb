class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[ new create destroy ]

  def new
    current_user.friend_request(@user)
    redirect_back(fallback_location: root_path)
    # current_user.reload
  end

  def create
    current_user.accept_request(@user)
    redirect_back(fallback_location: root_path)
    # current_user.reload
  end

  def destroy
    current_user.reject_request(@user)
    redirect_back(fallback_location: root_path)
    # current_user.reload
  end

  def show
    @users = User.all_except(current_user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
