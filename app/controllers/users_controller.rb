class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = @users.order(:email)
  end

  def show
  end
end
