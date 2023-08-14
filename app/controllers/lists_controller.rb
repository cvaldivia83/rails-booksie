class ListsController < ApplicationController
  def index
    @lists = policy_scope(List)
  end

  def show
    @list = List.find(params[:id])
    authorize @list
  end
end
