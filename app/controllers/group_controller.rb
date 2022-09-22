# frozen_string_literal: true

class GroupController < ApplicationController # rubocop:todo Style/Documentation
  before_action :authenticate_user!, except: :index

  def index
    if user_signed_in?
      @groups = current_user.groups
    else
      redirect_to new_user_session_path
    end
  end

  def new; end

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
