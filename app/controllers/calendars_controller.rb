class CalendarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @date = params[:id] || Time.now 
    @tasks = Task.all
    
  end
end
