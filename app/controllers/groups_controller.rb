class GroupsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @categories = Group.where(user_id: @user.id)
  end

  def new
    @group = Group.new
    respond_to do |format|
      format.html { render :new, locals: { group: @group } }
    end
  end

  def create
    @group = Group.new(permit_group)
    @group.user_id = current_user.id
    @group.icon = URI.parse(params[:icon]) if params[:icon].present?
    if @group.save
      flash[:success] = 'succeful;y created'
      redirect_to user_groups_path(current_user)
    else
      flash.now[:error] = 'failed to create new category'
      render :new
    end
  end

  private

  def permit_group
    params.require(:new_group).permit(:name, :icon)
  end
end
