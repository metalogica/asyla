class CalendarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @date = params[:id]
  end
end
