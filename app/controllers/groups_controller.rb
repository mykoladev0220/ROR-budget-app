class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @groups = Group.where(author_id: current_user.id)
  end

  def new
    @user = current_user
    @group = Group.new
  end
  def create
      @group=Group.new(group_params)
      @group.author_id=current_user.id

      if @group.save
          redirect_to user_groups_path notice: 'category added successfully'
      else
          render :new
      end
  end

  def group_params
      params.require(:group).permit(:name, :icon)
  end
end
