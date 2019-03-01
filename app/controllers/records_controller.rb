class RecordsController < ApplicationController
  def index
    @records = Record.where(user: current_user)
  end

  def show
    @record = Record.find(params[:id])
    end
end

