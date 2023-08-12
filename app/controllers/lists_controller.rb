class ListsController < ApplicationController
  def index
    @list = policy_scope(List)
  end
end
