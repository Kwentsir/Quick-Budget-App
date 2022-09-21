# frozen_string_literal: true

class GroupController < ApplicationController # rubocop:todo Style/Documentation
  load_and_authorize_resource

  def index
    @groups = current_user.groups
    @user = current_user
  end

  def new
    @user = current_user
    @group = @user.groups.new
  end

  def create
    @user = current_user
    @group = @user.groups.create(group_params)
    if @group.save
      flash[:notice] = 'Group created successfully'
      redirect_to group_index_path
    else
      flash.now[:alert] = 'Group creation failed'
      render action: 'new'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
