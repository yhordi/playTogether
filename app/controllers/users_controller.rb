class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def user_by_url
  end

  def user_by_id
  end

  def friends_list
  end

end