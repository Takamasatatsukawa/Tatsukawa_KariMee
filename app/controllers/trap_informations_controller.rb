class TrapInformationsController < ApplicationController

  
    def index
      @traps = Trap.includes(:user).all
      render json: @traps.as_json(include: { user: { only: [:id, :name, :contact_information] } })
    end
  
   
  end
  