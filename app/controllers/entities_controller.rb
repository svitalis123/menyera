class EntitiesController < ApplicationController
  def index
    @category = current_user.groups.find(params[:group_id])
    @entities = @category.entities.order(created_at: :desc)
    @total_amount = @entities.sum(:amount)
  end

  def new
    @entity = Entity.new
    render :new
  end

  def create
    @entity = Entity.new(valid_params)
    @entity.user_id = current_user.id
    @entity.save!

    @entity_groups = EntityGroup.create(params.require(:new_entity).permit(:amount, :group_id))
    @entity_groups.entity_id = @entity.id
    # Use shorthand form for redirecting and pass parameters directly
    return unless @entity_groups.save!

    redirect_to user_group_entities_path(current_user)
  end

  private

  def valid_params
    params.require(:new_entity).permit(:name, :amount)
  end
end
