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

  def update
    @activity = Activity.find(params[:id])
    if ( current_user && current_user.user_role.role == 0 )
      @activity.update(approved: 1)
    else
      flash.now[:alert] = "You're not authorized to perform this action !"
    end
    redirect_to activities_path
  end
end
