class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def index
    @group = Group.where(user: current_user)
  end

  def show
    @group = Group.where(user_id: current_user.id)
    @items = GroupItem.all.order(created_at: :desc)
  end

  def create
    group = Group.create(groups_params)
    group.user = current_user
    flash[:notice] = if group.save
                       'Group Category created successfully'
                     else
                       'Error'
                     end
    redirect_to groups_path
  end

  private

  def groups_params
    params.require(:group).permit(:name, :icon)
  end
end
