class RecordsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show] #Delete this when we build devise functionality.

  def index
    @records = Record.where(user: current_user)
  end

  def show
    @records = Record.new
  end

end
