class EntityGroupsController < ApplicationController
  def new
    @entity_groups = EntityGroup.new
  end
end
