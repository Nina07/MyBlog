class ActivitiesController < ApplicationController
  def index
    @users = User.where(user_role_id: 2)
    @activities = Activity.order(updated_at: 'desc')
  end

  def show
  end

  def new
  end

  def create
  end
end
