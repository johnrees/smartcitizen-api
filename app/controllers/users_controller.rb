class UsersController < ApplicationController

  # api :GET, '/users', "List users"
  def index
    @users = User.all
    paginate json: @users
  end

  # api :GET, '/users/:id', "Show an individual user"
  # param :id, Integer, required: true
  def show
    @user = User.find(params[:id])
    render json: @user
  end

end
