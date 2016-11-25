class BoardsController < ApplicationController
  def show
    @tasks = Task.all
  end
end
