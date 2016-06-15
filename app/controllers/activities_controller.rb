class ActivitiesController < ApplicationController
  def index
    @users = User.where(role: 'moderator')
    @activities = Activity.order(updated_at: 'desc')
  end

  def show
  end

  def new
  end

  def create
  end
end
