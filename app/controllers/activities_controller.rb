class ActivitiesController < ApplicationController
  def index
    @user_activities = Activity.joins(:user).order(updated_at: 'desc')
    @activities = Activity.order(updated_at: 'desc')
  end

  def show
  end

  def new
  end

  def create
  end

  def update
    if ( current_user && current_user.user_role.role == 0 )
      @activity = Activity.find(params[:id])
      @activity.update(approved: 1)
    else
      flash.now[:alert] = "You're not authorized to perform this action !"
    end
    redirect_to activities_path
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to activities_path
  end
end
