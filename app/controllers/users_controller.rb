class UsersController < ApplicationController
  def index
    @users =
      if params[:search].present?
        User.where(name: params[:search])
      else
        User.all.order(order_query)
      end
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
