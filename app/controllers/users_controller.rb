class UsersController < ApplicationController
  def index
    @users = User.all.order(order_query)
  end

  def create
    User.import(params[:file])
    redirect_to users_path, notice: 'Users imported'
  rescue => e
    redirect_to users_path, notice: e
  end

  private
  def order_query
    "#{params['field'] || 'name'} #{params['order'] || 'asc'}"
  end
end
