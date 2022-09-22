# frozen_string_literal: true

class EntitiesController < ApplicationController # rubocop:todo Style/Documentation
  def index
    @group = current_user.groups.find(params[:group_id])
    @entities = @group.entities
  end

  def new
    @group = current_user.groups.find(params[:group_id])
    @entity = @group.entities.new
  end

  def create # rubocop:todo Metrics/AbcSize, Metrics/MethodLength
    @group = current_user.groups.find(params[:group_id])
    @entity = @group.entities.create(entity_params)
    puts @entity
    if @entity.save
      @goup_entity = @entity.group_entities.create(group_id: @group.id, entity_id: @entity.id)
      if @goup_entity.save
        flash[:notice] = 'Entity created successfully'
        redirect_to group_entities_path(@group)
      else
        flash.now[:alert] = 'Entity group creation failed'
        render action: 'new'
      end
    else
      flash.now[:alert] = 'Entity creation failed'
      render action: 'new'
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
