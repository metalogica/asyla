class RecordsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show] #Delete this when we build devise functionality.

  def index
  end

  def show
    @record = Record.find(params[:id])
  end
end
